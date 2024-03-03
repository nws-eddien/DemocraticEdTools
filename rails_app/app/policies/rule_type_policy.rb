class RuleTypePolicy < ApplicationPolicy
  def index?
    allowed_to?("indexRuleTypes")
  end

  def create?
    allowed_to?("createRuleType")
  end

  def new?
    allowed_to?("createRuleType")
  end

  def show?
    allowed_to?("createRuleType")
  end

  def update?
    allowed_to?("createRuleType")
  end

  def edit?
    allowed_to?("createRuleType")
  end

  def destroy?
    allowed_to?("deleteRuleType")
  end

end
