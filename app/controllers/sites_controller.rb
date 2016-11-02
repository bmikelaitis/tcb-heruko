class SitesController < ApplicationController 
	def index
		@sites = Site.all
		if params[:search]
    		@sites = Site.search(params[:search]).order("created_at DESC")
		else
    		@sites = Site.all.order('created_at DESC')
		end
	end

	def new
		@site = Site.new
	end

	def create 
		@site = Site.new(site_params)
		if @site.save
			flash[:success] = "The site has been created succesfully"
			if @site.subtype == 'Street'
				redirect_to new_street_path(param_1: @site.id)
			elsif @site.subtype == 'Wash'
				redirect_to new_wash_path(param_1: @site.id)
			else 
				redirect_to new_park_path(param_1: @site.id)
			end
			
		else
			render 'new'
		end
	end

	def edit
		@site = Site.find(params[:id])
	end

	def update
		@site = Site.find(params[:id])
		if @site.update(site_params)
			flash[:success] = "The site has been updated succesfully"
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@site = Site.find(params[:id])
		#@receipts = @user.receipts.order("updated_at DESC")

	end

private
	def site_params
		params.require(:site).permit(:id, :subtype, :siteStreet, :siteCrossStreets, :siteCounty, :siteZip, :status, :cityWardNumber, :countyDistrict, :permitRequired, :permitInPlace)
	end

end