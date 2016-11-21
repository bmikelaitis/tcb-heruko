class StreetsController < ApplicationController 
    def index
		@streets = Street.all
		@site = Street.all
		if params[:search]
    		@streets = Site.search(params[:search]).order("created_at DESC")
		else
    		@streets = Street.all.order('created_at DESC')
		end
	end

	def new
		@street = Street.new
	end

	def create 
	    
		@street = Street.new(street_params)
		if @street.save
			flash[:success] = "The street has been created succesfully"
			session[:street_id] = @street.id
			redirect_to    streets_path
		else
			render 'new'
		end
	end

	def edit
		@street = Street.find(params[:id])
	end

	def update
		@street = Street.find(params[:id])
		if @street.update(street_params)
			flash[:success] = "The street has been updated succesfully"
			redirect_to site_path(param_1: @street.site_id)
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
        @site = Street.find(params[:id])
        @street = Street.find(params[:id])

 
	end

private
	def street_params
		params.require(:street).permit(:id, :siteStreet, :siteCrossStreets, :siteCounty, :siteZip, :status, :cityWardNumber, :countyDistrict, :permitRequired, :permitInPlace, :start, :end, :direction, :miles)
	end

end