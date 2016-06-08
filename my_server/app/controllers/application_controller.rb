class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
=begin
    gcmid = params[:gcmid]
      caller_ids = params[:caller_ids]
      file = params[:uploadedfile]
      filename = params[:filename]
      admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
      if admin #8

      else #8
        render json: { message: 'Not an Authorized Admin!' }, status: 401
        message = "Not an Authorized Admin!"
        push_gcm(gcmid,message)  
      end #8
=end
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
   include SessionsHelper
  include SMSFu
  include ApplicationHelper
  before_filter :timeout
  before_filter :gv_ip
  def authenticate
    unless current_user
       render json: { message: 'invalid credentails' }, status: 403
    else
      puts "******************session[:ngo_user_id] #{session[:ngo_user_id]}**********************************"
      puts "****************************@current_user #{@current_user}****************************************"
    end
  end
=begin
  def current_user
    @admin ||= Admin.where(gcmid: params[:authenticity_token]).first
  end
=end
  def push_gcm_1
    response = push_gcm(params[:reg_id],params[:message],params[:code])
    render json: { message: response }, status: 200
  end

end

=begin
begin
  response = RestClient::Request.execute(method: , url: , timeout: 5)
rescue => e
  e.response
end
#RestClient::Request.execute(method: , url: , timeout: 5)

#Net::http
begin
  response = Net::HTTP.get_response(uri)
rescue StandardError => error
  puts error.inspect
end

=end