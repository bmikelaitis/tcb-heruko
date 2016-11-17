class ProjectsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]
before_filter :assign_function

def assign_function
@var = 1
end
	
  def index
			@projects = Project.all
		if params[:search]
    		@projects = Project.search(params[:search]).order("created_at DESC")
		else
    		@projects = Project.all.order('created_at DESC')
		end
  end
    
    def project
      @projects = Project.where("site_id IS NULL")
    end

    
	def new
		@project = Project.new
	end
	
    def create
      @project = Project.new(project_params)

      if @project.save
        redirect_to :back
        flash[:success] =  'Your Project was successfully Requested!'
      else
        redirect_to :back
        flash[:success] = "Your Project wasn't requested!"
      end
    end
    
    def show
            @project = Project.find(params[:id])
    end

def update
    @project = Project.find(params[:id])
        if @project.update(project_params)
            flash[:success] = "Your Project Was Updated!"
            redirect_to project_path(@project)
        else
            render 'edit'
        end    
end
 
  private
    def project_params
      params.require(:project).permit(:organization_id, :site_id, :projectName, :projectLocation, :yearlyParticipants, :ifCanceled, :startDate)
    end


end
