
class LogBookEntriesController < ApplicationController
  def index
    initialize #Initializes the parameters

    #The Include parameter in the following find method reduces the number of sql queries that run on the databse. Joins, runs an inner join. 
    #@log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project], :include =>[:user, :github_project ], :order => @extended_order)
    @log_book_entries = LogBookEntry.find(:all, :include =>[:user, :github_project ], :order => @extended_order)
    @size = @log_book_entries.size #Used in views to show how many results were found. we cannot paginate before this else we get a wrong number. 
    @log_book_entries = @log_book_entries.paginate :page => params[:page] 
  end

  def show
    @log_book_entry = LogBookEntry.find(params[:id])
  end

  def new
    @log_book_entry = LogBookEntry.new
  end
    
  def edit
    @log_book_entry = LogBookEntry.find(params[:id])
  end

  def create
    @log_book_entry = LogBookEntry.new(params[:log_book_entry])

    if @log_book_entry.save # Gags: Save validates the entries. 
      flash[:notice] = 'LogBookEntry was successfully created.'
      redirect_to(@log_book_entry) 
    else # incase of an error in saving
      render :action => "new" 
    end
  end

  def update
    @log_book_entry = LogBookEntry.find(params[:id])

    if @log_book_entry.update_attributes(params[:log_book_entry])
      flash[:notice] = 'LogBookEntry was successfully updated.'
      redirect_to(@log_book_entry)
    else
      render :action => "edit" 
    end
  end

  def destroy
    @log_book_entry = LogBookEntry.find(params[:id])
    @log_book_entry.destroy
    redirect_to(log_book_entries_url) 
  end
end

