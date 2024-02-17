class GroupPolicy < ApplicationPolicy
  attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      @user.is_allowed_to?("indexGroups")
    end

  def create?
    @user.is_allowed_to?("createGroup")
  end

  def new?
    @user.is_allowed_to?("createGroup")
  end

    def show?
      @user.is_allowed_to?("createGroup")
    end

  def update?
    @user.is_allowed_to?("createGroup")
  end

  def edit?
    @user.is_allowed_to?("createGroup")
  end

    def destroy?
      @user.is_allowed_to?("deleteGroup")
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
