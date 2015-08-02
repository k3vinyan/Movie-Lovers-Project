require 'active_support/core_ext/hash/keys'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :movies
  has_many :comments

  def create
    flash[:notice] = "Post successfully created"
  end


end
