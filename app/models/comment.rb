class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :update_comments_counter
  after_destroy :update_comments_counter

  private

  def update_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
