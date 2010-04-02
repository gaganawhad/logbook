class SearchController < ApplicationController

  def index
  end

  def label
    #TODO: LogBookEntry.scoped(:order => :title, :joins => [:user, :github_project]).find_tagged_with('tag3')
    #matched_ids = LogBookEntry.find_tagged_with(params[:tag]).collect {|e| e.id} 
      #@matched_entries = LogBookEntry.find(matched_ids, :joins => [:user, :github_project], :order => params[:order]) 

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
    
    @matched_entries = LogBookEntry.scoped(:order => order , :joins => [:user, :github_project]).find_tagged_with(params[:token])#.paginate :page => params[:page] #using scoped to run the find_tagged_by rather than having an array being returned.  
    @matched_entries = @matched_entries.paginate :page => params[:page]  
  end
  
  def query
    #TODO: implement LogBookEntry.find_by_query(params[:query]) in the model
    
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

    #if params[:query]
      # @matched_entries = LogBookEntry.find_by_query(params[:query])
     
    
      @token = params[:token]

      @matched_entries = LogBookEntry.find_by_query(params[:token], order )#TODO replace the last parameter by one that gives a random order
#     @matched_entries = LogBookEntry.find_by_query(params[:query], 'log_book_entries.created_at' )#TODO replace the last parameter by one that gives a random order
      @matched_entries = @matched_entries.paginate :page => params[:page]
      #     @log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project]) 
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
    #end


  end

  def initialize 

  end


end
