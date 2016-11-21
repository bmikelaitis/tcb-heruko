class ShorttermeventsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]
before_filter :assign_function

def assign_function
@var = 2
end
	
  def index
    @var = 3
			@shorttermevents = Shorttermevent.all
		if params[:search]
    		@shorttermevents = Shorttermevent.search(params[:search]).order("created_at DESC")
		else
    		@shorttermevents = Shorttermevent.all.order('created_at DESC')
		end
  end
    
    def event
      @shorttermevents = Shorttermevent.where("site_id IS NULL")
    end

    
	def new
		@shorttermevent = Shorttermevent.new
	end
	
    def create
      @shorttermevent = Shorttermevent.new(shorttermevent_params)

      if @shorttermevent.save
        redirect_to :back
        flash[:success] =  'Your Short Term Event was successfully Requested!'
      else
        redirect_to :back
        flash[:success] = "Your Short Term Event wasn't requested!"
      end
    end
    
    def show
            @shorttermevent = Shorttermevent.find(params[:id])
    end

def update
    @shorttermevents = Shorttermevent.find(params[:id])
        if @shorttermevents.update(shorttermevent_params)
            flash[:success] = "Your Short Term Event Was Updated!"
            redirect_to shorttermevent_path(@shorttermevents)
        else
            render 'edit'
        end    
end
 
  private
    def shorttermevent_params
      params.require(:shorttermevent).permit(:organization_id, :site_id, :eventtype, :timeFrame, :startDate, :endDate)
    end


end
