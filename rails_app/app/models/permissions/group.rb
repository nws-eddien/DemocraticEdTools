class Group < ApplicationRecord
    validates :name, presence: true, allow_blank: false, uniqueness: true
    has_many :membershiplevels, dependent: :destroy
    has_many :users, through: :membershiplevels
    has_and_belongs_to_many :decision_making_units
    after_create :add_basic_membershiplevel
    after_create_commit -> { broadcast_prepend_later_to "groups", partial: "user_manager/groups/group", locals: { group: self }, target: "groups" }
    after_update_commit -> { broadcast_update_later_to "groups", partial: "user_manager/groups/group", locals: { group: self }, target: self }
    after_destroy_commit -> { broadcast_remove_to "groups", target: self }

    def add_basic_membershiplevel
        self.membershiplevels.create({:name => "basic"})
        self.set_default_membershiplevel
    end

    def set_default_membershiplevel(id=0)
        level = self.membershiplevels.where(:id => id).first || self.default_membershiplevel || self.membershiplevels.first
        self.default_membershiplevel_id = level.id
        self.save
    end

    def default_membershiplevel
        self.membershiplevels.where(:id => self.default_membershiplevel_id).first
    end

    def users_count
        self.users.uniq.count
    end

    def previous_group
        Group.ordered.where("name < ?", name).last
    end

    scope :ordered, -> {order(name: :asc)}
end
