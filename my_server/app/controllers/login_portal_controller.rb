class LoginPortalController < ApplicationController
  def new
  end

  def invalid
  end



  def create #2

    ngo_user = NgoUser.where(email: params[:session][:email].downcase, password: params[:session][:password]).first

    if ngo_user.nil? #3
      flash.now[:error] = "Invalid email/password combination."
      flash[:danger] = "Invalid email/password combination."
      flash[:notice] = 'Invalid email/password combination.'
      render :invalid
    else #3
      if ngo_user.authenticated == false #4
        puts "Not authenticated"
        puts ngo_user.authenticated
        render :invalidemail
      else #4
        puts "User Authenticated"
        sign_in(ngo_user)
        render action: "create" , alert: "already logged in" if current_user
      end      #4
    end #3
  end #2

end
