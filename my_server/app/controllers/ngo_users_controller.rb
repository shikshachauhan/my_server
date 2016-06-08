class NgoUsersController < ApplicationController #1
  before_filter :authenticate
  def new
  	#@ngo_user = NgoUser.new
  end

  def create #2

    puts params[:ngoname]
    puts params[:username]
    puts params[:age]
    puts params[:phone]
    puts params[:city]
    puts params[:website]
    puts params[:email]
    puts params[:field]
    puts params[:password]
    puts params[:password_confirmation]
    @ngo_user = NgoUser.new(ngoname: params[:ngoname], username: params[:username], age: params[:age], phone: params[:phone], city: params[:city], website: params[:website], email: params[:email], field: params[:field], password: params[:password], authenticated: 0, created_at: Time.now.inspect, updated_at: Time.now.inspect)
    puts "DONE***************************************"

    if @ngo_user.save #3
      render "welcome/homepage", controller: "welcome", notice: 'NGO account successfully created.'
      #render action: "show", notice: 'NGO account successfully created.'
  	else #3
  		render action: "new"
  	end #3

  end #2

  def show
  	@ngo_user = NgoUser.find(params[:id])
  end

  private
  #def ngo_user_params
   # params.request
end #1
