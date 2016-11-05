class ProjectsController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]

	
    def index
		
    end
    
    def project
      @projects = Project.where("site_id IS NULL")
    end
    
    def assign
      @sites = Site.find_by_sql( "SELECT sites.id, sites.subtype, sites.siteStreet, sites.siteCrossStreets, sites.siteCounty, sites.siteZip, sites.cityWardNumber, sites.countyDistrict FROM c9.sites, c9.projects WHERE sites.id != projects.site_id")
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
        @organization = Organization.find(params[:organization_id])
    @project = Project.find(params[:id])
        if @project.update(project_params)
            flash[:success] = "Your Project Was Updated!"
            redirect_to projects_path(@project)
        else
            render 'edit'
        end    
end

 
 
  private
    def project_params
      params.require(:project).permit(:organization_id, :site_id, :projectName, :projectLocation, :yearlyParticipants, :ifCanceled, :startDate)
    end

end
