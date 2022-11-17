# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin?
      can :manage, :all
    end

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, Property do |property|
      user == property.user
    end

    can :crud, Question do |question|
      user == question.user
    end

    can :crud, Answer do |answer|
      user.persisted?
    end

  end
end
