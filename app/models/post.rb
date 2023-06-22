class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :text, presence: true, length: { minimum: 3, maximum: 250 }
  after_create :post_count_updater

  def post_count_updater
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
