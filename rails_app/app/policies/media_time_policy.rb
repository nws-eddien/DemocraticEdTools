class MediaTimePolicy < ApplicationPolicy
  attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      @user.permissions.include? ("indexGroups")
    end

    def create?
      @user.permissions.include? ("createGroups")
    end

    def show?
      @user.permissions.include? ("createGroupsa")
    end

  def update?
    @user.permissions.include? ("createGroups")
  end

  def edit?
    puts @record.user.id
    puts @user.id
    puts @user.permissions.include?("createGaaroups") || true
    @user.permissions.include?("createGaaroups") || @record.user.id == @user.id
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
