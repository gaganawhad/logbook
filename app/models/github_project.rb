class GithubProject < ActiveRecord::Base
  has_many :log_book_entries
  validates_presence_of :title, :github_name 
  validates_uniqueness_of :title, :github_name 
  
  #Used in views to let user select GithubProject by title and not id
  def self.options_for_projects
    GithubProject.find(:all, :order => "title").collect {|p| [p.title, p.id]} # the way they are aligned ie title first and id later, makes select show title in the view and not id.     
  end


end
