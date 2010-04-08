class LogBookEntry < ActiveRecord::Base
  acts_as_taggable
  belongs_to :github_project
  belongs_to :user
  validates_presence_of :title, :description, :solution, :user_id, :github_project_id
  validates_uniqueness_of :title
  cattr_reader :per_page
  @@per_page = 10


  def self.find_by_query(my_query, my_order)
    matched_entries = Array.new   
    log_book_entries = LogBookEntry.find(:all, :joins => [:user, :github_project], :order => my_order, :include =>[:user, :github_project]) 
    log_book_entries.each do |entry|
      testString = String.new
      testString += entry.user.name
      testString += entry.github_project.github_name
      testString += entry.github_project.title
      [:title, :description, :solution, :sha_of_problem, :sha_of_solution ].each do |op|
        testString += entry.send(op)
      end
      
      if testString[my_query]
        matched_entries << entry 
      end

    end
    matched_entries
  end



end
    
