class Comment < ActiveRecord::Base
  belongs_to :User
  belongs_to :Post
end
