class ReportsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]

  def index
	@reports = Report.all
  end

	def new
		@report = Report.new
	end
	
    def create
      @report = Report.new(report_params)

      if @report.save
        redirect_to :back
        flash[:success] =  'Your Report was successfully Saved!'
      else
        redirect_to :back
        flash[:success] = "Your Report wasn't Saved!"
      end
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
