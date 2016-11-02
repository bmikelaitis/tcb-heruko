class CeremoniesController < ApplicationController 
    def index
		@ceremonies = Ceremony.all
		if params[:search]
    		@ceremonies = Ceremony.search(params[:search]).order("created_at DESC")
		else
    		@ceremonies = Ceremony.all.order('created_at DESC')
		end
	end

	def new
		@ceremony = Ceremony.new
	end

	def create 
		@ceremony = Ceremony.new(ceremony_params)
		if @ceremony.save
			flash[:success] = "The Ceremony has been created succesfully"
			redirect_to    ceremonies_path
		else
			render 'new'
		end
	end

	def edit
		@ceremony = Ceremony.find(params[:id])
	end

	def update
		@ceremony = Ceremony.find(params[:id])
		if @ceremony.update(ceremony_params)
			flash[:success] = "The Ceremony has been updated succesfully"
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@ceremony = Ceremony.find(params[:id])
		#@receipts = @user.receipts.order("updated_at DESC")

	end

private
	def ceremony_params
		params.require(:ceremony).permit(:ceremonyName, :locationPreference, :agreementSigned, :date)
	end

end
