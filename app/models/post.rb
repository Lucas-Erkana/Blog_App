class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
  
    def update_posts_counter
      update(posts_counter: comments.count)
    end
  
    def recent_comments(limit = 5)
      comments.order(created_at: :desc).limit(limit)
    end
  end
  