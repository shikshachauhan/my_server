class SurveyPortalController < ApplicationController
  include SurveyPortalHelper
  include LocationHelper
  before_filter :authenticate


  def listsurvey
    @response = RestClient.get("#{@gv_ip}/vapp/api/v1/survey_survey/?ai=60&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json")
    @response = JSON.parse(@response.body)

    @response['objects'].each do |sur|
      #Rails.logger.info sur['id']
      p sur['id']
    end
    render action: "listsurvey"
  end




  def create #1.1
    #Fetch all the surveys
    puts "Fetch all the surveys"
    begin
      @response = RestClient::Request.execute(method: :get , url: "#{@gv_ip}/vapp/api/v1/survey_survey/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json",timeout: @timeout)
    rescue => e
      e.inspect
    end

    if e.present? #9 If error caught
      case e.message
        when "Request Timeout" #10
          render json: { message: e.message }, status: 408
        else #10
          render json: { message: e.message }, status: e.message[0..2].to_i
      end #10
      return
    else #9 If NO error caught
      @response = JSON.parse(@response.body)
      if @response['objects'] #11
        puts "Got all surveys!"
        @response['objects'].each do |sur| #4
          #Rails.logger.info sur['id']
          p sur['id']
        end#4
      else #11
        puts "Could not get surveys!"
      end #11
    end #9

    #fetching all the locations
    puts 'Fetching locations'
    @location_response = getlocation()
    @location_response['objects'].each do |sur| #4
      #Rails.logger.info sur['id']
      p sur['desc']
    end#4
    if @response.present? && @location_response.present?
      render action: "create"
    else
      puts "values missing"
      #render action:
    end
  end #1.1

  def SelectAdmintoLaunchSurvey
    @selected_survey = params[:selected_survey]
    @selected_location = params[:selected_location]
    puts "*********************************selected_survey #{@selected_survey}****************************************"
    puts "*********************************selected_location #{@selected_location}************************************"
    render action: "SelectAdmintoLaunchSurvey"
  end

  def complete
    @selected_admin = params[:selected_admin]
    @selected_survey = params[:selected_survey]
    @selected_location = params[:selected_location]
    puts "*********************************selected_survey #{@selected_survey}****************************************"
    puts "*********************************selected_location #{@selected_location}************************************"
    puts "*********************************selected_admin #{@selected_admin}****************************************"
    @selected_admin_id = @selected_admin.split(' - ')[0]
    puts "*********************************selected_admin ID #{@selected_admin_id}****************************************"
    message = "Notification by NGO Preeti to launch a survey"
    reg_id = Admin.where(id: @selected_admin_id)
    push_gcm(message,reg_id,1)
    render action: "complete"
  end
  def survey_response
    puts params[:survey_id]
    sur = params[:survey_id].to_i
    @response = RestClient.get("#{@gv_ip}/vapp/api/v1/survey_record/cdr_records/?ai_id=60&survey_id=27&limit=20&page=1&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json")
    @response = JSON.parse(@response.body)
    puts @response
    render action: "survey_response"
  end

  def survey_question
    puts params[:form_id]
    form = params[:form_id].to_i
    puts form
    @response = RestClient.get("#{@gv_ip}/vapp/api/v1/form_question/?form_id=70&ai=60&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json")
    @response = JSON.parse(@response.body)
    puts @response
    render action: "survey_question"

  end
end
