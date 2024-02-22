class RolePolicy < ApplicationPolicy
  def index?
    allowed_to?("indexRoles")
  end

  def create?
    allowed_to?("createRole")
  end

  def new?
    allowed_to?("createRole")
  end

  def show?
    allowed_to?("createRole")
  end

  def update?
    allowed_to?("createRole")
  end

  def edit?
    allowed_to?("createRole")
  end

  def destroy?
    allowed_to?("deleteRole")
  end

end
