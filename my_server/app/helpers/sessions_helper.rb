module SessionsHelper

	def sign_in(ngo_user)
		session[:ngo_user_id] = ngo_user.id
		self.current_user = ngo_user
		puts "******************session[:ngo_user_id] #{session[:ngo_user_id]}**********************************"
		puts "****************************@current_user #{@current_user}****************************************"
	end

	def current_user=(ngo_user)
		@current_user = ngo_user
		puts("2")
	end

	def current_user
		@current_user ||= NgoUser.find_by(id: session[:ngo_user_id])
	end

	def signed_in?
		current_user.present?
	end

	def sign_out
		session[:ngo_user_id] = nil
		session.delete(:ngo_user_id)
		self.current_user = nil
	end

	def current_user?(ngo_user)
		ngo_user == current_user
	end

	def deny_access
		redirect_to signin_path, :notice => "Please sign in to access this page."
	end
end
