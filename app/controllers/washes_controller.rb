class WashesController < ApplicationController 
    def index
		@washes = Wash.all
		@site = Wash.all
		if params[:search]
    		@washes = Site.search(params[:search]).order("created_at DESC")
		else
    		@washes = Wash.all.order('created_at DESC')
		end
	end

	def new
		@wash = Wash.new
	end

	def create 
	    
		@wash = Wash.new(wash_params)
		if @wash.save
			flash[:success] = "The wash has been created succesfully"
			session[:wash_id] = @wash.id
			redirect_to    washes_path
		else
			render 'new'
		end
	end

	def edit
		@wash = Wash.find(params[:id])
	end

	def update
		@wash = Wash.find(params[:id])
		if @wash.update(wash_params)
			flash[:success] = "The wash has been updated succesfully"
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
        @site = Wash.find(params[:id])
        @wash = Wash.find(params[:id])

 
	end

private
	def wash_params
		params.require(:wash).permit(:id, :siteStreet, :siteCrossStreets, :siteCounty, :siteZip, :status, :cityWardNumber, :countyDistrict, :permitRequired, :permitInPlace, :waterFlow, :Miles)
	end

end