class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    helper_method :current_user, :logged_in?, :require_same_user
  def current_user
    @current_user ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end
  def require_same_user(volunteer)
    @current_user = volunteer
  end
  
  def logged_in?
    !! current_user
  end
  
  def require_admin_user
		if current_user != @volunteer and !current_user.admin?
			flash[:danger] = "UNAUTHORIZED ACCESS!!!"
			redirect_to root_path
		end
  end
  
  def require_active_user
		if current_user != @volunteer and !current_user.active?
			flash[:danger] = "Your Account is Currently Inactive, Please Contact a System Administer"
			redirect_to volunteer_path(current_user)
		end
  end
  
  def require_user
  	if !logged_in? 
  		flash[:danger] = "You must be logged in to perform that action"
  		redirect_to :back
  	end
      rescue ActionController::RedirectBackError

      redirect_to root_path
  end
end
