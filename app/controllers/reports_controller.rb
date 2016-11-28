class ReportsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]

  def index
    @var = 4
	@reports = Report.all
	if params[:search]
    	@reports = Report.search(params[:search]).order("created_at DESC")
	else
    	@reports = Report.all.order('created_at DESC')
	end
  end

	def new
	    @project = Project.find( params[:project_id])
		@report = Report.new
	end
	
def destroy
		@report = Report.find(params[:id])
		@report.destroy
		flash[:success] = "Report Deleted"
		redirect_to reports_path
end
  
    def create
      @report = Report.new(report_params)

      if @report.save
        redirect_to volunteer_path(current_user)
        flash[:success] =  'Your Report was successfully Saved!'
      else
        redirect_to :back
        flash[:success] = "Your Report wasn't Saved!"
      end
    end
def edit
		@report = Report.find(params[:id])
end
    
    def show
            @report = Report.find(params[:id])
    end

def update
    @report = Report.find(params[:id])
        if @Report.update(report_params)
            flash[:success] = "Your Report Was Updated!"
            redirect_to report_path(@report)
        else
            render 'edit'
        end    
  
end
 
  private
    def report_params
      params.require(:report).permit(:project_id, :workDone, :numVolunteers, :totalHours, :dateLastWork)
    end


end
