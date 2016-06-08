require 'net/http'
require "uri"

class MessageController < ApplicationController #1
  include MessageHelper
  def upload #2
    puts "******************************In Message Controller*****************************"
    gcmid = params[:gcmid]
    message_id = params[:message_id]
    caller_ids = params[:caller_ids]
    message_args = params[:message_args]

    caller_ids = FindCallerIds(params[:mv_caller],params[:caller_ids],params[:group_ids],params[:ai],params[:start_time],params[:end_time])
    message_code = CheckParams_Gcm_CallerIds_Message(gcmid, caller_ids, message_id, message_args)
    message_code = message_code.split('+')

    if message_code[1] != "200"   #3
      render json: { message: message_code[0]}, status: message_code[1].to_i
      return
    end #3

    puts "gcmid #{gcmid}"
    puts "message_args #{message_args}"
    puts "message_id #{message_id}"
    puts "callerids #{caller_ids}"

    admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
    puts "admin "+admin.to_s
    if admin.present? #8 if admin found with given gcmid
      begin
        response = RestClient::Request.execute(method: :post, url: "#{@gv_ip}/vapp/api/v1/sms_message/send/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", ai: 10,message_id: message_id, caller_ids: caller_ids , max_tries: 3, message_args: message_args , timeout: @timeout)
      rescue => e
        e.inspect
      end

      if e.present? #9 If error caught on creating schedule
        case e.message #10
          when "Request Timeout" #10
            render json: { message: e.message }, status: 408
          else #10
            render json: { message: e.message }, status: e.message[0..2].to_i
        end #10
        return
      else #9 If NO error caught
        response = JSON.parse(response.body)
        if response['objects'] #11 if id is there in the response , means created the schedule
          puts "Message Sent!"
          @msg = Message.create(MemberId: admin.id, Template_id: message_id, Message_params: message_args, Status: 'Completed', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
          @task = Task.create(ItemId: @msg.id, TaskName: 'LaunchMessage', Status: 'Completed', MemberId: admin.id, Type: 'Message', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
          render json: { message: 'Message launched successfully!' }, status: 200
          message = "Message launched successfully!"
          code = 4
          push_gcm(gcmid,message,code)
          #put in delivered task queue
        else #11 if id is not there in the response , means not created the schedule
          puts 'Message Rejected'
          @msg = Message.create(MemberId: admin.id, Template_id: message_id, Message_params: message_args, Status: 'Rejected', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
          @task = Task.create(ItemId: @msg.id, TaskName: 'LaunchMessage', Status: 'Rejected', MemberId: admin.id, Type: 'Message', Contacts: params[:caller_ids], Groups: params[:group_ids], created_at: Time.now.inspect, updated_at: Time.now.inspect)
          render json: { message: 'Request not accepted! Parameters incorrect! Failure!'}, status: 403
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
