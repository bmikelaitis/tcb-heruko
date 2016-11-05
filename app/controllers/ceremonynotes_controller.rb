class CeremonynotesController < ApplicationController
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
		@ceremonynote = Ceremonynote.new
	end
	
    def create
      @ceremonynote = Ceremonynote.new(note_params)

      if @ceremonynote.save
        redirect_to :back
        flash[:success] = 'Your Note was successfully saved!'
      else
        redirect_to :back
        flash[:success] = "Your Note wasn't posted!"
      end
    end


def update
        @ceremony = Ceremony.find(params[:ceremony_id])
    @ceremonynote = Ceremonynote.find(params[:id])
        if @ceremonynote.update(note_params)
            flash[:success] = "Your Note Was Updated!"
            redirect_to ceremonies_path(@ceremony)
        else
            render 'edit'
        end    
end

 
 
  private
    def note_params
      params.require(:ceremonynote).permit(:ceremony_id, :ceremonyNotes, :volunteer_id)
    end
    
    
end
