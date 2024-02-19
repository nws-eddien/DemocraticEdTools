class RolePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.is_allowed_to?("indexRoles")
  end

  def create?
    @user.is_allowed_to?("createRole")
  end

  def new?
    @user.is_allowed_to?("createRole")
  end

  def show?
    @user.is_allowed_to?("createRole")
  end

  def update?
    @user.is_allowed_to?("createRole")
  end

  def edit?
    @user.is_allowed_to?("createRole")
  end

  def destroy?
    @user.is_allowed_to?("deleteRole")
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
