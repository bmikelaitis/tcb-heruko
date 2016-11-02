class CeremonyawardsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]
	# def show
	# 	@review = Review.find(params[:id])
	# end

	# def new
	# 	@review = Review.new
	# end
	
def index
		
end
	def new
		@ceremonyaward = Ceremonyaward.new
	end


def create
    
    @ceremonyaward = @ceremonyaward.new(award_params)
    @ceremony = Ceremony.find(params[:ceremony_id])

	if @ceremonyaward.save
			flash[:success] = "Award was created succesfully"
    	redirect_to ceremonyaward_path(@ceremony)
    else
			flash[:danger] = "The award could not be saved"
			redirect_to :back
	end
	
			
end

def update
        @ceremony = Ceremony.find(params[:ceremony_id])
    @ceremonyaward = Ceremonyaward.find(params[:id])
        if @ceremonyaward.update(award_params)
            flash[:success] = "Your Review Was Updated Tastefully!"
            redirect_to ceremonies_path(@ceremony)
        else
            render 'edit'
        end    
    end

 
 
  private
    def award_params
      params.require(:ceremonyaward).permit(:ceremonyAwardTitle, :ceremonyAwardInfo)
    end
    
end
