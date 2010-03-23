class SearchController < ApplicationController
  def index
  end
  def label
    matched_ids = LogBookEntry.find_tagged_with(params[:tag]).collect {|e| e.id} 
    @matched_entries = LogBookEntry.find(matched_ids, :joins => [:user, :github_project], :order => params[:order]) 
    if params[:tag]
      @tag = params[:tag]
    end
  end
  
  def query
    if params[:query]

      @query = params[:query]
      @matched_entries = Array.new   
      @log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project]) 
      
      
      @log_book_entries.each do |entry|
        testString = String.new
        testString += entry.user.name
        testString += entry.github_project.github_name
        testString += entry.github_project.title
        [:title, :description, :solution, :sha_of_problem, :sha_of_solution ].each do |op|
          testString += entry.send(op)
        end
        

        if testString[@query]
          @matched_entries << entry #will this matched entries arry be clean to begin with?
        end
      end
    end


  end


end
