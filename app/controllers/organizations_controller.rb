class OrganizationsController < ApplicationController 
	#before_action :require_user, except: [:new, :create]
	#before_action :require_active_user, except: [ :edit, :update, :show, :create, :password]
	#before_action :set_user, only: [:edit, :update, :show]
	#before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@organizations = Organization.all
		if params[:search]
    		@organizations = Organization.search(params[:search]).order("created_at DESC")
		else
    		@organizations = Organization.all.order('created_at DESC')
		end
	end

	def new
		@organization = Organization.new
	end

	def join
		@organizations = Organization.all
		if params[:search]
    		@organizations = Organization.search(params[:search]).order("created_at DESC")
		else
    		@organizations = Organization.all.order('created_at DESC')
		end
	end

	def create 
		@organization = Organization.new(organization_params)
		if @organization.save
			flash[:success] = "Your account has been created succesfully"
			session[:organization_id] = @organization.id
			redirect_to    organizations_path
		else
			render 'new'
		end
	end

	def edit
		@organization = Organization.find(params[:id])
	end

	def update
		@organization = Organization.find(params[:id])
		if @organization.update(organization_params)
			flash[:success] = "Your account has been updated succesfully"
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@organization = Organization.find(params[:id])
		
		#@receipts = @user.receipts.order("updated_at DESC")

	end

private
	def organization_params
		params.require(:organization).permit(:organizationName, :organizationStreet, :organizationCity, :organizationState, :organizationZip, :organizationPhone)
	end

	def set_organization
		@organization = Organization.find(params[:id])
	end
	
	
end
