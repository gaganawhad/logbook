class DropIndexUsersOnId < ActiveRecord::Migration
  def self.up
    remove_index :users, :id
  end

  def self.down
  end
end
