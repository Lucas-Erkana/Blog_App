class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  def user_has_liked(post_id)
    likes.exists?(post_id: post_id)
  end

  def remove_user_like(post_id)
    likes.find_by(post_id: post_id).destroy
  end

  def add_user_like(post_id)
    likes.create(post_id: post_id)
  end
end
