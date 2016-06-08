class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def index
    render json: { users: User.all.to_json }, status: 200
  end

  def create
  	user = User.new(JSON.parse params[:user])

    if user.save
       render json: { message: 'User created successfully', user: user.to_json ,status: 200}, status: 200
    else
  		 render action: "new"
    end
  end


end
