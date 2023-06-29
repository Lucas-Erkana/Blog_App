class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # , :confirmable

  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true

  # has_one_attached :photo # Add this line to handle the photo attachment

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  def user_has_liked?(post, user)
    likes.exists?(post:, user:)
  end

  def remove_user_like(post, user)
    likes.find_by(post:, user:).destroy
  end

  def add_user_like(post, user)
    likes.create(post:, user:)
  end
end
