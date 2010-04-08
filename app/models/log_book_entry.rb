class LogBookEntry < ActiveRecord::Base
  #Used as a part of adding tags. 
  acts_as_taggable
  
  belongs_to :github_project
  belongs_to :user
  validates_presence_of :title, :description, :solution, :user_id, :github_project_id
  validates_uniqueness_of :title
  
  #Used with the pagination gem that is installed
  cattr_reader :per_page
  @@per_page = 10 #Sets the number of entries per page. 


  # The following methed is used to find entries that match a query that is passed to it through the parameters. 
  def self.find_by_query(params={})
    matched_entries = Array.new   
    log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project], :order => params[:order], :include =>[:user, :github_project]) #includes reduce number of sql queries run. 
    log_book_entries.each do |entry| #creates a large string that holds all entries in the particular entry
      testString = String.new
      testString += entry.user.name
      testString += entry.github_project.github_name
      testString += entry.github_project.title
      [:title, :description, :solution, :sha_of_problem, :sha_of_solution ].each do |op|
        testString += entry.send(op)
      end
      
      if testString[params[:query]]
        matched_entries << entry 
      end
    end
  
    matched_entries
  end



end
    
