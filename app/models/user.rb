class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes


  validates :name, presence: true


  def recent_post
    posts.order(created_at: :desc).limit(3)
  end


  def user_has_liked?(post, user)
    likes.exists?(post: post, user: user)
  end


  def remove_user_like(post, user)
    likes.find_by(post: post, user: user).destroy
  end


  def add_user_like(post, user)
    likes.create(post: post, user: user)
  end
end
