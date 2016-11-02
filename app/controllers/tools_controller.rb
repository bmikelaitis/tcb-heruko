class ToolsController < ApplicationController 
    def index
		@tools = Tool.all
		if params[:search]
    		@tools = Tool.search(params[:search]).order("created_at DESC")
		else
    		@tools = Tool.all.order('created_at DESC')
		end
	end

	def new
		@tool = Tool.new
	end

	def create 
		@tool = Tool.new(tool_params)
		if @tool.save
			flash[:success] = "The Tool has been created succesfully"
			session[:tool_id] = @tool.id
			redirect_to    tools_path
		else
			render 'new'
		end
	end

	def edit
		@tool = Tool.find(params[:id])
	end

	def update
		@tool = Tool.find(params[:id])
		if @tool.update(tool_params)
			flash[:success] = "The Tool has been updated succesfully"
			#redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@tool = Tool.find(params[:id])
		#@receipts = @user.receipts.order("updated_at DESC")

	end

private
	def tool_params
		params.require(:tool).permit(:toolName, :totalQuantity, :description)
	end

end