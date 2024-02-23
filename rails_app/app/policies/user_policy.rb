class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    allowed_to?("createUser")
  end

  def new?
    create?
  end

  def update?
    allowed_to?("updateUser")
  end

  def edit?
    update?
  end

  def destroy?
    allowed_to?("destroyUser")
  end


end
