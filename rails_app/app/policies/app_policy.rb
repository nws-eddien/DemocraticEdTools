class AppPolicy < ApplicationPolicy
  def index?
    allowed_to?("indexApps")
  end
  def show?
    allowed_to?("createApp")
  end
  def update?
    allowed_to?("createApp")
  end
  def edit?
    allowed_to?("createApp")
  end

end