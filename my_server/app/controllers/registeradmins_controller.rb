require 'securerandom'

class RegisteradminsController < ApplicationController
include LocationHelper
before_filter :authenticate
  def getlocations
    @response = getlocation()
    puts "Got all Locations!"
    puts @response
  end

  def index
    @admins = User.all
  end
 
  def show
    @admin = User.find(params[:id])
  end
 
  def new
    @admin = User.new
  end
 
  def edit
    @admin = User.find(params[:id])
  end
 
  def create
      pin = 1
      while pin < 111111  do
         pin = SecureRandom.random_number(999999)
      end
      puts "Ngoname"
      puts session[:ngoname]
      puts params[:name]
      puts params[:gender]
      puts params[:age]
      puts params[:contact]
      puts params[:location]
      @user = User.create(name: params[:name], contact: params[:contact], gender: params[:gender], age: params[:age], city: params[:location].split('-')[0], state: params[:location].split('-')[0], block: params[:location].split('-')[1], district: params[:location].split('-')[2], location: params[:location], created_at: Time.now.inspect, updated_at: Time.now.inspect)
      @admin = Admin.create(user_id: @user.id, pin: pin, logged_in: 0 )
      if @admin.present?
        message = "#{params[:name]} having the mobile number #{params[:contact]} has been registered by NGO #{session[:ngoname]} as an admin for Gram vaani. Use PIN #{pin} for authentication. Link to download the app: http://gramvaani.org:8080/GCMFinal.apk"
        response = Unirest.get("https://webaroo-send-message-v1.p.mashape.com/sendMessage?message=#{message}&phone=#{params[:contact]}",headers:{"X-Mashape-Key" => "f06AZcQGeAmshIDGUUTrEys1oikdp1J69xSjsn08nRoXRaVURu"})
        puts response.body
      
        #redirect_to @admin, notice: 'Admin successfully created.'  #doesn't work
        #redirect_to registeradmins_path  #redirects to index
         render action: "show"
      else
        render action: "new"
      end
  end
 
  def update
    @admin = User.find(params[:id])
 
    if @admin.update(user_params)
      redirect_to @admin
    else
      render 'edit'
    end
  end
 
  def destroy
    @admin = User.find(params[:id])
    @admin.destroy
 
    redirect_to registeradmins_path
  end
 
  private
    
end

