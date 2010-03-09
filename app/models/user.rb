class User < ActiveRecord::Base
  has_many :log_book_entries
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
end
