class ParksController < ApplicationController 
    def index
		@parks = Park.all
		@site = Park.all
		if params[:search]
    		@parks = Site.search(params[:search]).order("created_at DESC")
		else
    		@parks = Park.all.order('created_at DESC')
		end
	end

	def new
		@park = Park.new
	end

	def create 
	    
		@park = Park.new(park_params)
		if @park.save
			flash[:success] = "The park has been created succesfully"
			session[:park_id] = @park.id
			redirect_to    parks_path
		else
			render 'new'
		end
	end

	def edit
		@park = Park.find(params[:id])
	end

	def update
		@park = Park.find(params[:id])
		if @park.update(park_params)
			flash[:success] = "The park has been updated succesfully"
			redirect_to site_path(param_1: @park.site_id)
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
        @site = Park.find(params[:id])
        @park = Park.find(params[:id])

 
	end

private
	def park_params
		params.require(:park).permit(:id, :siteStreet, :siteCrossStreets, :siteCounty, :siteZip, :status, :cityWardNumber, :countyDistrict, :permitRequired, :permitInPlace, :parkType, :acres)
	end

end