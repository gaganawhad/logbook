class SearchController < ApplicationController

  def index
  end

  def label
    initialize
    @matched_entries = LogBookEntry.scoped(:order => @order , :joins => [:user, :github_project]).find_tagged_with(params[:token]).paginate :page => params[:page] #using scoped to run the find_tagged_by rather than having an array being returned.  
  
  end
  
  def query
    initialize 
    @matched_entries = LogBookEntry.find_by_query(params[:token], @order ).paginate :page => params[:page]#TODO replace the last parameter by one that gives a random order
  end

end
