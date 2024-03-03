class RulePolicy < ApplicationPolicy
  def index?
    allowed_to?("indexRules")
  end

  def create?
    allowed_to?("createRule")
  end

  def new?
    allowed_to?("createRule")
  end

  def show?
    allowed_to?("createRule")
  end

  def update?
    allowed_to?("createRule")
  end

  def edit?
    allowed_to?("createRule")
  end

  def destroy?
    allowed_to?("deleteRule")
  end

end
