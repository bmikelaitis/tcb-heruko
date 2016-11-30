class EvaluationreportsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]

  def index
  @var = 1
	@evaluationreports = Evaluationreport.all
	if params[:search]
    	@evaluationreports = Evaluationreport.search(params[:search]).order("created_at DESC")
	else
    	@evaluationreports = Evaluationreport.all.order('created_at DESC')
	end
  end

	def new
	    @organization = Organization.find( params[:organization_id])
		@evaluationreport = Evaluationreport.new
	end
	
  def destroy
		@evalutionreport = Evaluationreport.find(params[:id])
		@evalutionreport.destroy
		flash[:success] = "Report Deleted"
		redirect_to evaluationreports_path
  end
  
    def create
      @evaluationreport = Evaluationreport.new(evaluationreport_params)

      if @evaluationreport.save
        redirect_to volunteer_path(current_user)
        flash[:success] =  'The Report was successfully saved!'
      else
        redirect_to :back
        flash[:success] = "The Report was NOT successfully saved!"
      end
    end
def edit
		@evaluationreport = Evaluationreport.find(params[:id])
end
    
def show
    @var = 0
    @user = current_user_id.id
    @evaluationreport = Evaluationreport.find(params[:id])
end

def update
    @evaluationreport = Evaluationreport.find(params[:id])
        if @evaluationreport.update(evaluationreport_params)
            flash[:success] = "The Report Was Updated!"
            redirect_to evaluationreport_path(@evaluationreport)
        else
            render 'edit'
        end    

end
 
  private
    def evaluationreport_params
      params.require(:evaluationreport).permit(:admin_id, :organization_id, :cleanUpsDone, :cleanUpsRequired, :date, :evalPeriodStart, :evalPeriodEnd)
    end


end
