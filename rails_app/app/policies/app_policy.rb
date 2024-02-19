class AppPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
  def index?
    @user.is_allowed_to?("indexApps")
  end
  def show?
    @user.is_allowed_to?("createApp")
  end
  def update?
    @user.is_allowed_to?("createApp")
  end
  def edit?
    @user.is_allowed_to?("createApp")
  end
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end
  end
end