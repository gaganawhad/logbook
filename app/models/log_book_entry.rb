class LogBookEntry < ActiveRecord::Base
  belongs_to :github_project
  belongs_to :user
  validates_presence_of :title, :description, :solution, :user_id, :github_project_id
  validates_uniqueness_of :title
end
    
