class ManagementinfosController < ApplicationController 
    def create

		@managementinfo = managementinfo.new(managementinfo_params)
		@managementinfo.volunteer = current_user.id
    end
	
    private
	def organization_info_params
		params.require(:organization).permit(:organizationName, :organizationStreet, :organizationCity, :organizationState, :organizationZip, :organizationPhone)
	end
end