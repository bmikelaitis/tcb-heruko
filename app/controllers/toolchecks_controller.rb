class ToolchecksController < ApplicationController
# before_action :admin_user, :current_user, only: :destroy
# before_action :require_same_user, only: [:edit, :update]

  def index
  @var = 1
	@toolchecks = Toolcheck.all
	  if params[:search]
    	  @toolchecks = Toolcheck.search(params[:search]).order("created_at DESC")
	  else
    	  @toolchecks = Toolcheck.all.order('created_at DESC')
	  end
  end

	def new
	    @organization = Organization.find( params[:organization_id])
		@toolcheck = Toolcheck.new
	end
	
	
  def destroy
		@toolcheck = Toolcheck.find(params[:id])
		@toolcheck.destroy
		flash[:success] = "Report Deleted"
		redirect_to toolchecks_path
  end
	
	
  def create
      @toolcheck = Toolcheck.new(toolcheck_params)

      if @toolcheck.save
        redirect_to volunteer_path(current_user)
        flash[:success] =  'The Tool was successfully Checked out!'
      else
        redirect_to :back
        flash[:success] = "The Tool was NOT successfully Checked out!"
      end
  end
   
    
  def edit
		@toolcheck = Toolcheck.find(params[:id])
  end
    
    
  def show
      @var = 0
      @user = current_user_id.id
            @toolcheck = Toolcheck.find(params[:id])
  end


  def update
    @toolcheck = Toolcheck.find(params[:id])
        if @toolcheck.update(toolcheck_params)
            flash[:success] = "The Checkout Was Updated!"
            redirect_to toolcheck_path(@toolcheck)
        else
            render 'edit'
        end    
  
  end
 
 
  private
    def toolcheck_params
      params.require(:toolcheck).permit(:organization_id, :tool_id, :admin_id, :Type, :Status, :quantityRented, :approved, :dateCheckedOut)
    end


end

