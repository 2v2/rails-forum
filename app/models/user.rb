class User < ActiveRecord::Base
  validates_uniqueness_of :screen_name
  
  has_secure_password
  has_many :entries
  has_many :comments
end
