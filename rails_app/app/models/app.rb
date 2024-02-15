class App < ApplicationRecord
    has_many :roles


    def permissions
        case self.name
        when "UserManager"
            ["createUser", "deleteUser", "editUser", "showUser", "indexUsers"]
        when "MediaTime"
            ["createMediaBan","approveMediaBan"]
        end
    end
end
