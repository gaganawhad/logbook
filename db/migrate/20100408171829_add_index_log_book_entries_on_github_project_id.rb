class AddIndexLogBookEntriesOnGithubProjectId < ActiveRecord::Migration
  def self.up
    add_index :log_book_entries, :github_project_id
  end

  def self.down
    remove_index :log_book_entries, :github_project_id
  end
end
