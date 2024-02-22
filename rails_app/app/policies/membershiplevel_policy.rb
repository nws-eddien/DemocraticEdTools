class MembershiplevelPolicy < ApplicationPolicy
  def create?
    allowed_to? ("createMembershiplevel")
  end

  def new?
    allowed_to? ("createMembershiplevel")
  end
  def update?
    allowed_to? ("updateMembershiplevel")
  end

  def edit?
    allowed_to? ("updateMembershiplevel")
  end
  def destroy?
    allowed_to? ("deleteMembershiplevel")
  end

end
