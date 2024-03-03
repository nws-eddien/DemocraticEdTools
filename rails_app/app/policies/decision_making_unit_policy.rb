class DecisionMakingUnitPolicy < ApplicationPolicy
  def index?
    allowed_to?("indexDecisionMakingUnits")
  end

  def create?
    allowed_to?("createDecisionMakingUnit")
  end

  def new?
    allowed_to?("createDecisionMakingUnit")
  end

  def show?
    allowed_to?("createDecisionMakingUnit")
  end

  def update?
    allowed_to?("createDecisionMakingUnit")
  end

  def edit?
    allowed_to?("createDecisionMakingUnit")
  end

  def destroy?
    allowed_to?("deleteDecisionMakingUnit")
  end

end
