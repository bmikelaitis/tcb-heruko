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
      @ceremonyaward = Ceremonyaward.new(award_params)

      if @ceremonyaward.save
        redirect_to :back
        flash[:success] =  'Your Award was successfully saved!'
      else
        redirect_to :back
        flash[:success] =  "Your Award wasn't posted!"
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
      params.require(:ceremonyaward).permit(:ceremony_id, :ceremonyAwardTitle, :ceremonyAwardInfo)
    end
    
    def find_award
      @ceremonyaward = Ceremonyaward.find_by_id(params[:ceremonyaward_id]) if params[:ceremonyaward_id]
      @ceremonyaward = Ceremony.find_by_id(params[:ceremony_id]) if params[:ceremony_id]
    end
    
end
