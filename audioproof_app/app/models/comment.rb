class Comment < ActiveRecord::Base
  belongs_to :User
  belongs_to :Post
  validates :user_id, presence: true
  validates :post_id, presence: true, length: { maximum: 256 }
end
