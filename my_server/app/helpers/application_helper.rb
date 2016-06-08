require 'gcm'
module ApplicationHelper #1
  def timeout
    #Define global timeout
    @timeout = 10
  end

  def gv_ip
    #Define GV IP
    @gv_ip = "http://internal.gramvaani.org:8081"
  end

  def hello(var)
		print "******************************************************************"
		print var
		print "*******************************************************************"
	end

	def push_gcm(reg_id,message,code)

		# A rediculously funny welcome message.
	  	#welcome_message = "Welcome! You have been registered. Buy some nice gas balloons with your name on it."
	  	
		# send welcome mesaage to the token's device
		gcm = GCM.new("AIzaSyCIZaRw4k2Kzu5u-CBdxpzK4b4aTebK4yc")
		registration_ids= [reg_id] # an array of one or more client registration IDs
		options = {data: {message: message, code: code}}
		response = gcm.send(registration_ids, options)
		puts response
		print response
    return response

  end

  def server_ip
  	@ip = "10.237.27.183"
  end
 
  def group2contacts(group_ids) #1
  	list = ""
    callerids = ""
  	puts group_ids
    group_ids = group_ids.split(',') #array of group ids
    #puts group_ids
    group_ids.each do |i|  #8
      begin #2
        response = RestClient.get("#{@gv_ip}/vapp/api/v1/callerinfo_contact/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json&contact_list=#{i}")
      rescue => e #2
        e.inspect
      end #2
      if response == nil #3 "NilClass"
        callerids = ""
      else #3
        if response['objects'] #4
          response = JSON.parse(response)
          #puts response
          response = response['objects'].collect { |item| item['number'].to_i }.to_s
          list = list+','+response[1..-2]
          #puts list
        else #4
          callerids = ""
        end #4
      end #3
    end #8 ending the loop to extract the numbers    
    callerids = list
    return callerids
  end #1

  def MVcallers_2(ai,start_date,end_date) #1
    puts "In MVcallers_2"
    begin
      response  = RestClient.get("#{@gv_ip}/vapp/api/v1/stats/get_callers?username=preeti&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&format=json&limit=0&ai=#{ai}&start=#{start_date}&end=#{end_date}")
    rescue => e
      e.inspect
    end
    if response == nil #2"NilClass"
      callerids = ""
    else #2
      response = JSON.parse(response)
      if response['callerids'] #3
        response = response['callerids']
        response = response[7..-4]
        response = response.split("', u'")
        callerids = ""
        response.each do |i| #4
          callerids = callerids+','+i
        end #4
        puts callerids
      else #3
        callerids = ""
      end #3
    end #2

    
    return callerids
  end #1

  def FindCallerIds(mv_caller, caller_ids, group_ids, ai, start_date, end_date) #2
    if mv_caller == "true" #8.1
      caller_ids = MVcallers_2(ai,start_date,end_date)
    else #8.1
      if !caller_ids.present? #3 if phone numbers not present
        if !group_ids.present? #7 Neither Phone numbers nor Group Ids are present
          puts 'Neither Phone numbers nor Group Ids are present! Failure!'
        else #7
          puts "Group Ids present"
          caller_ids = group2contacts(group_ids)
          puts "Contact list obtained from Groups"
        end #7
      end #3
    end #8.1
    return caller_ids
  end #2

  def RunSchedule(schedule_id, caller_ids)  #2
    begin
      response_run = RestClient::Request.execute(method: :post , url: "#{@gv_ip}/vapp/api/v1/schedule/run/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", schedule_id: schedule_id, number: caller_ids , timeout: @timeout)
    rescue => e
      e.inspect
    end

    if e.present? #9 If error caught on running schedule
      case e.message
      when "Request Timeout" #10
        render json: { message: e.message , error: true}, status: 408
      else #10
        render json: { message: e.message , error: true}, status: e.message[0..2].to_i
      end #10
      return false
    else #9 If NO error caught on running schedule
      response_run = JSON.parse(response_run.body)
      if response_run['success'] == true #11 if success == true means successfully run the schedule
        #render json: { message: 'Schedule created successfully!', error: false}, status: 200
        return true
      else #11 if success != true means did not run the schedule
        #render json: { message: 'Request not accepted! Could not run schedule!', error: true}, status: 403
        return false
      end #11
    end #9
  end #2




end #1



=begin
begin
  response = RestClient::Request.execute(method: , url: , timeout: @timeout)
rescue => e
  e.inspect
end
#RestClient::Request.execute(method: , url: , timeout: @timeout)

#Net::http
begin
  response = Net::HTTP.get_response(uri)
rescue StandardError => error
  puts error.inspect
end

=end
