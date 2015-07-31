class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :movies
  has_many :comments
end
