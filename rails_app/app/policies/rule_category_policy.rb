class RuleCategoryPolicy < ApplicationPolicy
  def index?
    allowed_to?("indexRuleCategorys")
  end

  def create?
    allowed_to?("createRuleCategory")
  end

  def new?
    allowed_to?("createRuleCategory")
  end

  def show?
    allowed_to?("createRuleCategory")
  end

  def update?
    allowed_to?("createRuleCategory")
  end

  def edit?
    allowed_to?("createRuleCategory")
  end

  def destroy?
    allowed_to?("deleteRuleCategory")
  end

end
