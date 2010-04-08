class SearchController < ApplicationController

  def index
  end

  def label
    initialize
    @matched_entries = LogBookEntry.scoped(:order => @order , :joins => [:user, :github_project], :include =>[:user, :github_project, :tags]).find_tagged_with(params[:token]) #using scoped to run the find_tagged_by rather than having an array being returned.  
    @size = @matched_entries.size
    @matched_entries = @matched_entries.paginate :page => params[:page]
  end
  
  def query
    initialize 
    @matched_entries = LogBookEntry.find_by_query(params[:token], @order )
    @size = @matched_entries.size
    @matched_entries = @matched_entries.paginate :page => params[:page]
  end

end
