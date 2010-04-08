class SearchController < ApplicationController

  def index
  end

  #Following action is used to display entries that match the tag requested by the user. 
  def label
    initialize
    @matched_entries = LogBookEntry.scoped(:order => @extended_order , :joins => [:user, :github_project], :include =>[:user, :github_project, :tags]).find_tagged_with(params[:token]) #using scoped to run the find_tagged_by rather than having an array being returned.  
    @size = @matched_entries.size
    @matched_entries = @matched_entries.paginate :page => params[:page]
  end
  
  #Following action is used to display entries that match the query entred by the user. 
  def query
    initialize 
    @matched_entries = LogBookEntry.find_by_query(:query =>params[:token], :order => @extended_order )
    @size = @matched_entries.size
    @matched_entries = @matched_entries.paginate :page => params[:page]
  end

end
