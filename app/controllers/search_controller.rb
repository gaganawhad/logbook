class SearchController < ApplicationController

  def index
  end

  def label
    if params[:direction] != nil && params[:order] != nil
      order = params[:order] + params[:direction]; 
    end
    
    if params[:token]
      @token = params[:token]
    end

    if params[:order]
      @prev_order = params[:order]
    end

    if params[:direction]
      @direction = params[:direction]
    end
    
    @matched_entries = LogBookEntry.scoped(:order => order , :joins => [:user, :github_project]).find_tagged_with(params[:token]).paginate :page => params[:page] #using scoped to run the find_tagged_by rather than having an array being returned.  
  
  end
  
  def query
    if params[:direction] != nil && params[:order] != nil
      order = params[:order] + params[:direction] 
    end
    
    if params[:token]
      @token = params[:token]
    end

    if params[:order]
      @prev_order = params[:order]
    end

    if params[:direction]
      @direction = params[:direction]
    end
  
    if params[:page]
      page = params[:page]
    end
    
    if params[:token]
      @token = params[:token]
    end

    @matched_entries = LogBookEntry.find_by_query(params[:token], order ).paginate :page => params[:page]#TODO replace the last parameter by one that gives a random order


  end

  def initialize # possibly use for initializing parameters in the query and lable actions 

  end


end
