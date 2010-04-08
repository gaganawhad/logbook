class User < ActiveRecord::Base
  has_many :log_book_entries
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  #Used in views to let user select the User by name and not id
  def self.options_for_users
    User.find(:all, :order => "name").collect {|u| [u.name, u.id]}  # the way they are aligned ie title first and id later, makes select show title in the view and not id.     
  end
end
