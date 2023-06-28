class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Define abilities for the different user roles
    can :manage, :all if user.role == 'admin'

    can :destroy, Post, user_id: user.id
    can :destroy, Comment, user_id: user.id

    can :create, Post
    can :create, Comment

    can :read, Post
    can :read, Comment
  end
end
