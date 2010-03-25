class SearchController < ApplicationController
  def index
  end
  def label
    #TODO: LogBookEntry.scoped(:order => :title, :joins => [:user, :github_project]).find_tagged_with('tag3')
    matched_ids = LogBookEntry.find_tagged_with(params[:tag]).collect {|e| e.id} 
    @matched_entries = LogBookEntry.find(matched_ids, :joins => [:user, :github_project], :order => params[:order]) 
    if params[:tag]
      @tag = params[:tag]
    end
  end
  
  def query
    #TODO: implement LogBookEntry.find_by_query(params[:query]) in the model
    if params[:query]
      # @matched_entries = LogBookEntry.find_by_query(params[:query])
      @query = params[:query]
      @matched_entries = LogBookEntry.find_by_query(params[:query])   
#      @log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project]) 
#      
#      
#      @log_book_entries.each do |entry|
#        testString = String.new
#        testString += entry.user.name
#        testString += entry.github_project.github_name
#        testString += entry.github_project.title
#        [:title, :description, :solution, :sha_of_problem, :sha_of_solution ].each do |op|
#          testString += entry.send(op)
#        end
#        
#
#        if testString[@query]
#          @matched_entries << entry #will this matched entries arry be clean to begin with?
#        end
#      end
    end


  end


end
