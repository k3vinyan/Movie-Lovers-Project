class Comment < ActiveRecord::Base
  belongs_to :movies
  belongs_to :users
end
