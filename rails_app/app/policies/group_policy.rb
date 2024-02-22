class GroupPolicy < ApplicationPolicy
  def index?
    allowed_to?("indexGroups")
  end

  def create?
    allowed_to?("createGroup")
  end

  def new?
    allowed_to?("createGroup")
  end

    def show?
      allowed_to?("createGroup")
    end

  def update?
    allowed_to?("createGroup")
  end

  def edit?
    allowed_to?("createGroup")
  end

  def destroy?
    allowed_to?("deleteGroup")
  end

end
