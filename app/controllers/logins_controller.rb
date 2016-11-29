class LoginsController < ApplicationController
	def new
		redirect_to volunteer_path(current_user) if logged_in?
	end

	def create
		volunteer = Volunteer.find_by(emailSignIn: params[:emailSignIn])
		if volunteer && volunteer.authenticate(params[:password])
			flash[:success] = "You are Logged In!"
			redirect_to root_path
			session[:volunteer_id] = volunteer.id
		else
			flash.now[:danger] = "Your email address or password does not match.  For Password Help, Please Contact a System Administration."
			render 'new'
		end
	end

	def destroy
		session[:volunteer_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end