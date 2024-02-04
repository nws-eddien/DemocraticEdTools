class Group < ApplicationRecord
    has_many :membershiplevels
    has_many :users, through: :membershiplevels
    after_create :add_basic_membershiplevel

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
end
