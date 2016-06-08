class RecordingsController < ApplicationController #1
  include RecordingsHelper
    def upload #2
      puts "******************************In Recordings Controller*****************************"
      gcmid = params[:gcmid]
      file = params[:uploadedfile]
      name = params[:uploadedfile].original_filename
      caller_ids = params[:caller_ids]
      
      caller_ids = FindCallerIds(params[:mv_caller],params[:caller_ids],params[:group_ids],params[:ai],params[:start_time],params[:end_time])

      message_code = CheckParams_Gcm_CallerIds_File(gcmid, caller_ids, file)
      message_code = message_code.split('+')

      if message_code[1] != "200"   #3
        render json: { message: message_code[0]}, status: message_code[1].to_i
        return
      end #3

      puts gcmid
      puts "callerids #{caller_ids}"
      puts name  
 
      directory = "Recordings/"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:uploadedfile].read) }
      flash[:notice] = "File uploaded"
 
      admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
      if admin #8 if admin found with given gcmid  #Create Schedule
       
        puts admin
        begin
          response = RestClient::Request.execute(method: :post, url: "#{@gv_ip}/vapp/api/v1/schedule/create/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", ai: 10, group_schedule_id: 129, name: name, start_time: "08:00:00", end_time: "21:00:00", is_repeated: "true", days_to_repeat: "0,1,2,3,4,5,6", is_active: "true", is_play_ai: "false", prompt_file: File.new("Recordings/#{name}") , timeout: @timeout)
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
              @rec = Recording.create(MemberId: admin.id, RecFileName: name, Status: 'Completed', GVID: response_run['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
              @task = Task.create(ItemId: @rec.id, TaskName: 'LaunchRecording', Status: 'Completed', MemberId: admin.id, GVID: response_run['id'], Type: 'Recording', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
              render json: { message: 'Recording Schedule launched successfully!' }, status: 200
              message = "Recording Schedule created successfully"
              code = 3
              push_gcm(gcmid,message,code)
            else #12
              @rec = Recording.create(MemberId: admin.id, RecFileName: name, Status: 'Pending', GVID: response['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
              @task = Task.create(ItemId: @rec.id, TaskName: 'LaunchRecording', Status: 'Pending', MemberId: admin.id, Type: 'Recording', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
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
end #1


=begin
    # debugger
    # params give you all the parameters in request
	# 'data' for us will come from params[:uploaded_file]
    data = params[:uploadedfile]
    #caller_ids = params[:caller_ids]
	#filename = data.original_filename

      target = open(path, 'w')
      target.write(file)
      target.close

     
	filename = "standard.mp3"
	target = open(filename, 'w')
	target.write(data)
	target.close
		if data
	      # uploading on gramvani
          container_object  = Net::HTTP.new('internal.gramvaani.org', 8080).request(Net::HTTP::Post.new('/vapp/api/v1/mnews_news/create_new_item/?ai_id=60&channel_id=5&title=surbhi&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json'))
          container_object = JSON.parse(container_object.body)
          response_object = RestClient.post("http://internal.gramvaani.org:8080/vapp/api/v1/mnews_news/upload_audio/?ai_id=352&news_id=#{container_object['id']}&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", audio_file: File.new(filename))#File.new('/Users/shikshachauhan/Downloads/standard.mp3')
          response_object = JSON.parse(response_object)  
          puts container_object
          puts response_object
          @Rec = Recording.create(MemberId: @admin.id, RecFileName: filename, Status: "Pending", GVID: response_object['id'])
          @Task = Task.create(ItemId: @Rec.id, TaskName: "Publish Recording", Status: "Publish Pending", MemberId: @Rec.MemberId, GVID: @Rec.GVID)
          render json: { message: 'File uploaded successfully' }, status: 200
	         
        else
	      render json: { message: 'File not correct' }, status: 403
	    end
	# write the file
    #File.open(path, "wb") { |f| f.write(params[:data].read) }
=end
	 
         



=begin
        if response == nil #3 if response is NULL means user is unauthorized to get the response
          render json: { message: 'Server Down!' }, status: 401
          message = "Server Down!"
          push_gcm(gcmid,message)
        else  #3 else if not null (MUltiple cases)
          response = JSON.parse(response.body)
          if response['id'] #4 if id is there in the response , means created the schedule
            puts "schedule created!"
            begin
              response_run = RestClient::Request.execute(method: :post , url: "http://internal.gramvaani.org:8080/vapp/api/v1/schedule/run/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", schedule_id: response['id'], number: caller_ids , timeout: 5)
            rescue => e
              e.response
            end
            if response_run == nil #4.1
              render json: { message: 'Server Down!' }, status: 401
              message = "Server Down!"
              push_gcm(gcmid,message)
            else  #4.1 else if not null (MUltiple cases)
              response_run = JSON.parse(response_run.body)
              puts response_run
              if response_run['id'] #5
                puts "schedule run successfully"
                @rec = Recording.create(MemberId: admin.id, RecFileName: name, Status: 'Completed', GVID: response_run['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
                puts "here4"            
                @task = Task.create(ItemId: @rec.id, TaskName: 'LaunchRecording', Status: 'Completed', MemberId: admin.id, GVID: response_run['id'], Type: 'Recording', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
                puts "here5"            
                render json: { message: 'Recording Schedule launched successfully!' }, status: 200
                message = "Recording Schedule created successfully"
                push_gcm(gcmid,message)            
              else #5 if error in reponse
                if response_run.class.name == "NilClass" #6 if reason is there
                render json: { message: 'Request not accepted! Parameters incorrect! Failure!'}, status: 403
                message = "Request not accepted! Parameters incorrect! Failure!"
                push_gcm(gcmid,message)
                  
                else #6 if internal server error
                  if response_run.code.to_i == 500 and response_run.body == "Internal Server Error" #7 if server error is there
                    @rec = Recording.create(MemberId: admin.id, RecFileName: name, Status: 'Pending', GVID: response['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
                    @task = Task.create(ItemId: @rec.id, TaskName: 'LaunchRecording', Status: 'Pending', MemberId: admin.id, Type: 'Recording', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
                    render json: { message: 'Internal Server Error! Server is down! Request submitted as Pending.'}, status: 500
                    message = "Internal Server Error! Server is down! Request submitted as Pending."
                    push_gcm(gcmid,message)            
                    #Put in Pending Task queue
                  end #7
                end #6
              end #5
            end #4.1
          else #4
            if response.class.name == "NilClass" #6 if error in response
              render json: { message: 'Request not accepted! Parameters incorrect! Failure!'}, status: 403
              message = "Request not accepted! Parameters incorrect! Failure!"
              push_gcm(gcmid,message)
                
              else #6 if server is down
                if response.code.to_i == 500 and response.body == "Internal Server Error" #7 if server error is there
                  @rec = Recording.create(MemberId: admin.id, RecFileName: name, Status: 'Pending', GVID: response['id'], Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
                  @task = Task.create(ItemId: @rec.id, TaskName: 'LaunchRecording', Status: 'Pending', MemberId: admin.id, Type: 'Recording', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect) 
                  render json: { message: 'Internal Server Error! Server is down! Request submitted as Pending.'}, status: 500
                  message = "Internal Server Error! Server is down! Request submitted as Pending."
                  push_gcm(gcmid,message)            
                  #Put in Pending Task queue
                end #7
              end #6
          end #4
        end #3
=end