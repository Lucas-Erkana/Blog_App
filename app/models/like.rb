class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post
  after_save :update_like_counter

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
