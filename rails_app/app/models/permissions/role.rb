class Role < ApplicationRecord
    has_and_belongs_to_many :membershiplevels
    has_and_belongs_to_many :users
    belongs_to :app

    





end
