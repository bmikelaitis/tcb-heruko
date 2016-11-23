class SignsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]

  def index
		
  end
  
  
	def new
		@sign = Sign.new
	end
	
	
  def destroy
		@sign = Sign.find(params[:id])
		@sign.destroy
		flash[:success] = "Sign Deleted"
		redirect_to :back
  end
  
	
  def create
      @sign = Sign.new(sign_params)

      if @sign.save
        redirect_to :back
        flash[:success] = 'Your Sign was successfully Create!'
      else
        redirect_to :back
        flash[:success] = "Your Sign wasn't posted!"
      end
  end


  def update
        @ceremony = Ceremony.find(params[:ceremony_id])
    @sign = Sign.find(params[:id])
        if @sign.update(sign_params)
            flash[:success] = "Your Sign Was Updated!"
            redirect_to ceremonies_path(@ceremony)
        else
            render 'edit'
        end    
  end

 
  private
    def sign_params
      params.require(:sign).permit(:ceremony_id, :milesNeeded, :signPlacement, :signLocation)
    end

end
