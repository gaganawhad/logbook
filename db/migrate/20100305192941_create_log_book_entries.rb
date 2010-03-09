class CreateLogBookEntries < ActiveRecord::Migration
  def self.up
    create_table :log_book_entries do |t|
      t.string :title
      t.text :description
      t.text :solution
      t.integer :user_id
      t.string :sha_of_problem
      t.string :sha_of_solution
      t.integer :github_project_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :log_book_entries
  end
end
