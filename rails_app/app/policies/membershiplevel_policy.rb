class MembershiplevelPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.is_allowed_to? ("createMembershiplevel")
  end

  def new?
    @user.is_allowed_to? ("createMembershiplevel")
  end
  def update?
    @user.is_allowed_to? ("updateMembershiplevel")
  end

  def edit?
    @user.is_allowed_to? ("updateMembershiplevel")
  end
  def destroy?
    @user.is_allowed_to? ("deleteMembershiplevel")
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
