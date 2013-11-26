class Ability
  include CanCan::Ability

    ROLES = %w[member moderator admin]
    def role?(base_role)
        role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
    end  

    private

    def set_member
      self.role = 'member'
    end

    def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :manage, Post, :user_id => user.id
      can :manage, Comment, :user_id => user.id
    end

    # Moderators can delete any post
    if user.role? :moderator
      can :destroy, Post
      can :destroy, Comment
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end
end
