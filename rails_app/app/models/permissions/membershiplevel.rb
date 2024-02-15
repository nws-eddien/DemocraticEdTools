class Membershiplevel < ApplicationRecord
    belongs_to :group
    has_many :memberships
    has_many :users, through: :memberships
    has_and_belongs_to_many :roles
    accepts_nested_attributes_for :users
    accepts_nested_attributes_for :roles
    validates_uniqueness_of :name, conditions: -> (membershiplevel) { where(group_id: membershiplevel.group_id ) }


    def is_default
        self.group.default_membershiplevel_id == self.id
    end

    def previous_membershiplevel
        group.membershiplevels.ordered.where("name < ?", name).last
    end

    scope :ordered, -> { order(name: :asc) }
end
