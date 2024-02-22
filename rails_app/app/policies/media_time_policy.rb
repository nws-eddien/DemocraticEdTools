class MediaTimePolicy < ApplicationPolicy
    def index?
      allowed_to? ("indexUsers")
    end

    def create?
      allowed_to? ("createUsers")
    end

    def show?
      allowed_to? ("showUsers")
    end

    def update?
      allowed_to? ("updateUsers")
    end

    def edit?
      @user.permissions.is_allowed_to? ("editUsers") || @record.user.id == @user.id
    end

end
