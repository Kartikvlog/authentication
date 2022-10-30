# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.super_admin?
        can :manage, :all 
    elsif user.admin? 
        #all line of code same work
        # can :read, :all
        # can :read, Company, user_id: user.id #user can access their own company
        # can :update, Company, user_id: user.id
        # can [:read, :update], Company, user_id: user.id
        can [:read, :update], Company, user: user

    end

    # return unless user.admin?
    #   can :read, :all
  end
end

# https://github.com/waiting-for-dev/devise-jwt
# https://github.com/waiting-for-dev/devise-jwt/issues/235
# https://github.com/CanCanCommunity/cancancan
# https://github.com/mperham/sidekiq/wiki/The-Basics