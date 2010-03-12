class SearchController < ApplicationController
  def label
    matched_ids = LogBookEntry.find_tagged_with(params[:tag]).collect {|e| e.id} 
    @matched_entries = LogBookEntry.find(matched_ids, :joins => [:user, :github_project], :order => params[:order]) 
    if params[:tag]
      @tag = params[:tag]
    end
  end
end
