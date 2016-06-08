class SurveyController < ApplicationController #1
  def createsurvey
    @response = RestClient.get("#{@gv_ip}/vapp/api/v1/survey_survey/?ai=60&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json")
    @response = JSON.parse(@response.body)

    @response['objects'].each do |sur|  
      #Rails.logger.info sur['id']
      p sur['id']
    end
    render action: "createsurvey"
  end

  def questionattr
    puts "form id"
    puts params[:form_id]
    puts "type"
    puts params[:type]    
  end
  
  def repo
  end
  #Get all the surveys on the app
  def listsurvey_app
    response = RestClient.get("#{@gv_ip}/vapp/api/v1/survey_survey/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json")
    response = JSON.parse(response.body)
    if response['objects']
      puts "Got all surveys!"
      render json: { message: response }, status: 200  
      else
      puts "Could not get surveys!"
      render json: { message: 'Could not get surveys!'}, status: 403
    end
  end

  #Get all the questions of a particular survey given the form id on the app.
  def getsurveyquestion_app
    form = params[:form_id].to_i
    response = RestClient.get("#{@gv_ip}/vapp/api/v1/form_question/?form_id=#{form}&ai=60&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json")
    response = JSON.parse(response.body)
    if response['objects']
      puts "Got all survey questions!"
      render json: { message: response }, status: 200  
      else
      puts "Could not get survey questions!"
      render json: { message: 'Could not get survey questions!'}, status: 403
    end
  end


  #Launches the schedule of the survey particular to an app instance.
  def launch #2
      puts "******************************In Launch Survey Controller*****************************"
      gcmid = params[:gcmid]
      caller_ids = params[:caller_ids]
      formid = params[:form_id]
      name = params[:survey_name] #schedule name


      caller_ids = FindCallerIds(params[:mv_caller],params[:caller_ids],params[:group_ids],params[:ai],params[:start_time],params[:end_time])

      message_code = CheckParams_Gcm_CallerIds_Name(gcmid, caller_ids, name)
      message_code = message_code.split('+')

      if message_code[1] != "200"   #3
        render json: { message: message_code[0]}, status: message_code[1].to_i
        return
      end #3
      puts name  
      puts gcmid
      puts "callerids #{caller_ids}"
      puts formid

      admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
      puts "admin "+admin.to_s
      if admin.present? #8 if admin found with given gcmid
        begin
          response = RestClient::Request.execute(method: :post , url: "#{@gv_ip}/vapp/api/v1/schedule/create/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", ai: 10, group_schedule_id: 129, name: name, start_time: "08:00:00", end_time: "21:00:00", is_repeated: "true", days_to_repeat: "0,1,2,3", is_active: "true", is_play_ai: "false" , timeout: @timeout)
        rescue => e
          e.inspect
        end
        
        if e.present? #9 If error caught on creating schedule
          case e.message
          when "Request Timeout" #10
            render json: { message: e.message }, status: 408
          else #10
            render json: { message: e.message }, status: e.message[0..2].to_i
          end #10
          return
        else #9 If NO error caught on creating schedule
          response = JSON.parse(response.body)
          if response['id'] #11 if id is there in the response , means created the schedule
            puts "schedule created!"
            if RunSchedule(response['id'],caller_ids) == true #12
              puts "schedule run successfully"
              @sur = Survey.create(MemberId: admin.id, SurveyName: name, Status: 'Completed', GVID: response_run['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
              @task = Task.create(ItemId: @sur.id, TaskName: 'LaunchSurvey', Status: 'Completed', MemberId: admin.id, GVID: response_run['id'], Type: 'Survey', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
              render json: { message: 'Survey Schedule launched successfully!' }, status: 200
              code = 2
              message = "Survey Schedule created successfully"
              push_gcm(gcmid,message,code)  
            else #12
              @sur = Survey.create(MemberId: admin.id, SurveyName: name, Status: 'Pending', GVID: response['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
              @task = Task.create(ItemId: @sur.id, TaskName: 'LaunchSurvey', Status: 'Pending', MemberId: admin.id, Type: 'Survey', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
              render json: { message: 'Internal Server Error! Server is down! Request submitted as Pending.'}, status: 500
              #message = "Internal Server Error! Server is down! Request submitted as Pending."
              #push_gcm(gcmid,message)            
              #Put in Pending Task queue
            end #12
          else #11 if id is not there in the response , means not created the schedule
            render json: { message: 'Request not accepted! Schedule not created!'}, status: 403
            #message = 'Request not accepted! Schedule not created!'
            #push_gcm(gcmid,message)
          end #11
        end #9
      else #8
        render json: { message: 'Not an Authorized Admin!' }, status: 401
        #message = "Not an Authorized Admin!"
        #push_gcm(gcmid,message)  
      end #8
  end #2

  def group2con
    caller_ids = group2contacts(params[:group_ids])
    render json: { message: caller_ids }, status: 200
    puts caller_ids
  end

  def MVcallers_1 #2
    puts "In MVcallers_1"
    callerids = MVcallers_2(params[:ai],params[:start_date],params[:end_date])
    puts "callerids #{callerids}"
    if callerids == "NIL" #3
      render json: { message: "Request not accepted! Either Parameters incorrect or Server down! Failure!" }, status: 403
    else #3
      render json: { message: callerids }, status: 200
    end #3
  end #2
end #1
