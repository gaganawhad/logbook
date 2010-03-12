class GithubProject < ActiveRecord::Base
  has_many :log_book_entries
  validates_presence_of :title, :github_name 
  validates_uniqueness_of :title, :github_name 
end
