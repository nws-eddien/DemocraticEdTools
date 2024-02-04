class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :membershiplevel
    has_many :roles, through: :membershiplevel
end
