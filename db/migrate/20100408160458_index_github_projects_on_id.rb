class IndexGithubProjectsOnId < ActiveRecord::Migration
  def self.up
    add_index :github_projects, :id
  end

  def self.down
    remove_index :github_projects, :id
  end
end
