class EssignsController < ApplicationController
    	before_filter :assign_function

def assign_function
@var = 2
end

def new
      @sites = Site.all
if params[:search]
    		@sites = Site.search(params[:search]).order("created_at DESC")
	else
    		@sites = Site.all.order('created_at DESC')
end

@shorttermevent = Shorttermevent.find(params[:shorttermevent_id])
       
end

end