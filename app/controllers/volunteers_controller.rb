class VolunteersController < ApplicationController 
	#before_action :require_user, except: [:new, :create]
	#before_action :require_active_user, except: [ :edit, :update, :show, :create, :password]
	#before_action :set_user, only: [:edit, :update, :show]
	#before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@volunteers = Volunteer.all
		if params[:search]
    		@volunteers = Volunteer.search(params[:search]).order("created_at DESC")
		else
    		@volunteers = Volunteer.all.order('created_at DESC')
		end
	end

	def new
		@volunteer = Volunteer.new
	end

	def create 
		@volunteer = Volunteer.new(volunteer_params)
		if @volunteer.save
			flash[:success] = "Your account has been created succesfully"
			session[:volunteer_id] = @volunteer.id
			redirect_to    volunteers_path
		else
			render 'new'
		end
	end

	def edit
		@volunteer = Volunteer.find(params[:id])
	end

	def update
		@volunteer = Volunteer.find(params[:id])
		if @volunteer.update(volunteer_params)
			flash[:success] = "Your account has been updated succesfully"
		redirect_to volunteer_path(@volunteer) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@volunteer = Volunteer.find(params[:id])
		#@receipts = @user.receipts.order("updated_at DESC")

	end

private
	def volunteer_params
		params.require(:volunteer).permit(:firstName, :lastName, :emailSignIn, :admin, :password, :title, :phone)
	end

	def set_volunteer
		@volunteer = Volunteer.find(params[:id])
	end
	
	
end
