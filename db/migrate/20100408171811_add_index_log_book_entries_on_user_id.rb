class AddIndexLogBookEntriesOnUserId < ActiveRecord::Migration
  def self.up
    add_index :log_book_entries, :user_id
  end

  def self.down
    remove_index :log_book_entries, :user_id
  end
end
