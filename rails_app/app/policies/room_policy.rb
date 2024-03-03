class RoomPolicy < ApplicationPolicy
  def index?
    allowed_to?("indexRooms")
  end

  def create?
    allowed_to?("createRoom")
  end

  def new?
    allowed_to?("createRoom")
  end

  def show?
    allowed_to?("createRoom")
  end

  def update?
    allowed_to?("createRoom")
  end

  def edit?
    allowed_to?("createRoom")
  end

  def destroy?
    allowed_to?("deleteRoom")
  end

end
