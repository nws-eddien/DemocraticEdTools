class MediaTimePolicy < ApplicationPolicy
  attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      @user.is_allowed_to? ("indexUsers")
    end

    def create?
      @user.is_allowed_to? ("createUsers")
    end

    def show?
      @user.is_allowed_to? ("showUsers")
    end

    def update?
      @user.is_allowed_to? ("updateUsers")
    end

    def edit?
      @user.permissions.is_allowed_to? ("editUsers") || @record.user.id == @user.id
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
