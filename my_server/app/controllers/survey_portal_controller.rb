class SurveyPortalController < ApplicationController
  include SurveyPortalHelper
  include LocationHelper
  before_filter :authenticate



  def listsurvey #1.0
    #fetching all the surveys
    ai_id = 60
    @survey_response = getsurvey(ai_id)

    if @survey_response.present? #2
      render action: "listsurvey"
    end #2
  end #1.0

  def create #1.1
    ai_id = 60
    #fetching all the surveys
    @survey_response = getsurvey(ai_id)

    #fetching all the locations
    @location_response = getlocation()

    if @survey_response.present? && @location_response.present?
      render action: "create"
    else
      puts "values missing"
    end
  end #1.1

  def SelectAdmintoLaunchSurvey
    @selected_survey = params[:selected_survey]
    @selected_location = params[:selected_location]
    puts "*********************************selected_survey #{@selected_survey}****************************************"
    puts "*********************************selected_location #{@selected_location}************************************"
    session[:selected_survey] = @selected_survey
    session[:selected_location] = @selected_location
    render action: "SelectAdmintoLaunchSurvey"
  end

  def complete
    @selected_admin = params[:selected_admin]
    @selected_survey = session[:selected_survey]
    @selected_location = session[:selected_location]
    puts "*********************************selected_survey #{@selected_survey}****************************************"
    puts "*********************************selected_location #{@selected_location}************************************"
    puts "*********************************selected_admin #{@selected_admin}****************************************"
    @selected_admin_id = @selected_admin.split(' - ')[0]
    @selected_admin_name = @selected_admin.split(' - ')[1]
    puts "*********************************selected_admin ID #{@selected_admin_id}****************************************"
    message = "Notification by #{@current_user.ngoname} to launch a survey named #{@selected_survey} at location #{@selected_location}"
    reg_id = Admin.where(id: @selected_admin_id)
    push_gcm(message,reg_id,1)
    render action: "complete"
  end

  def survey_response
    puts "***************************Survey ID #{params[:survey_id]} ************************************************"
    puts "********************************Form ID #{params[:form_id]} ***********************************************"

    @survey_id = params[:survey_id].to_i
    @form_id = params[:form_id].to_i

    #Fetching all the questons of form
    @question_response = getsurvey_question(@form_id)

    #setting ai_id
    ai_id = 60

    #fetching all the responses of survey_id
    @response_response = getsurvey_response(@survey_id,ai_id)

    #Hash for mainitaining a map count of question_id to number of responses
    @question_responsecount = Hash.new

    #Set for maintaining unique survey responders
    @unique_responders = Set.new

    #variable for counting total number of responses
    @total_no_responses = 0


    @response_response['data'].each do |r|
      r['detail'].each do |i|
        if @question_responsecount.key?(i['question_id'])
          @question_responsecount[i['question_id']] = @question_responsecount[i['question_id']] + 1
        else
          @question_responsecount[i['question_id']] = 1
        end
        @unique_responders.add(i['callerid'])
        @total_no_responses = @total_no_responses + 1
      end
    end

    #Printing all the values on terminal
    puts "Total numer of responses obtained #{@total_no_responses}"
    puts "Unique responders are #{@unique_responders.size} "
    @unique_responders.each do  |u|
      puts u
    end
    @question_responsecount.keys.each do |i|
      puts "#{i} ---> #{@question_responsecount[i]}"
    end
    render action: "survey_response"
  end

  def survey_question
    puts params[:form_id]
    @form_id = params[:form_id].to_i
    @question_response = getsurvey_question(params[:form_id].to_i)
    render action: "survey_question"
  end
end
