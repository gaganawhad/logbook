class LogBookEntriesController < ApplicationController
  # get /log_book_entries
  # get /log_book_entries.xml
  def index
    #TODO: Let me reverse the sort order
      @log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project], :order => params[:order]) 

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @log_book_entries }
    end
  end

  # GET /log_book_entries/1
  # GET /log_book_entries/1.xml
  def show
    @log_book_entry = LogBookEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @log_book_entry }
    end
  end

  # GET /log_book_entries/new
  # GET /log_book_entries/new.xml
  def new
    @log_book_entry = LogBookEntry.new

    respond_to do |format|# gags: This is where control goes to the view. it does work implicty, but it is explicity specified when we want format also in xml.  
      format.html # new.html.erb
      format.xml  { render :xml => @log_book_entry }
    end
    
    
  end

  # GET /log_book_entries/1/edit
  def edit
    @log_book_entry = LogBookEntry.find(params[:id])
  end

  # POST /log_book_entries
  # POST /log_book_entries.xml
  def create
    @log_book_entry = LogBookEntry.new(params[:log_book_entry])

    respond_to do |format|
      if @log_book_entry.save # Gags: Save validates the entries. 
        flash[:notice] = 'LogBookEntry was successfully created.'
        format.html { redirect_to(@log_book_entry) }
        format.xml  { render :xml => @log_book_entry, :status => :created, :location => @log_book_entry }
      else # incase of an error in saving
        format.html { render :action => "new" } # Gags: Render only renders views. it does not call the action new again. 
        format.xml  { render :xml => @log_book_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /log_book_entries/1
  # PUT /log_book_entries/1.xml
  def update
    @log_book_entry = LogBookEntry.find(params[:id])

    respond_to do |format|
      if @log_book_entry.update_attributes(params[:log_book_entry])
        flash[:notice] = 'LogBookEntry was successfully updated.'
        format.html { redirect_to(@log_book_entry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @log_book_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /log_book_entries/1
  # DELETE /log_book_entries/1.xml
  def destroy
    @log_book_entry = LogBookEntry.find(params[:id])
    @log_book_entry.destroy

    respond_to do |format|
      format.html { redirect_to(log_book_entries_url) }
      format.xml  { head :ok }
    end
  end
end
