class DropIndexGithubProjectsOnId < ActiveRecord::Migration
  def self.up
    remove_index :github_projects, :id
  end

  def self.down
  end
end
