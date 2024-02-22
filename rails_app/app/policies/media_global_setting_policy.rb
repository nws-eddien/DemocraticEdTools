class MediaGlobalSettingPolicy < ApplicationPolicy
   def allowed_to?(permission)
    @user.present? && @user.is_allowed_to?(permission)
  end

  def show?
    allowed_to?("showMediaGlobalSettings")
  end

  def update?
    allowed_to?("updateMediaGlobalSettings")
  end

  def edit?
    allowed_to?("updateMediaGlobalSettings")
  end

end
