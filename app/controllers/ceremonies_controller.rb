class CeremoniesController < ApplicationController 
    def index
    	@var = 1
		@ceremonies = Ceremony.select("*").joins(:project)

		if params[:search]
    		@ceremonies = Ceremony.search(params[:search]).order("created_at DESC")
		else
    		@ceremonies = Ceremony.all.order('created_at DESC')
		end
    end

	def new
		@project = Project.find( params[:project_id])
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
			redirect_to ceremony_path(@ceremony)
		else
			render 'edit'
		end
	end

	def show
		@var = 0
		@ceremony = Ceremony.find(params[:id])
		

	end

private
	def ceremony_params
		params.require(:ceremony).permit(:project_id, :ceremonyName, :locationPreference, :agreementSigned, :date)
	end

end
