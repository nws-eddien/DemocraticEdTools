class App < ApplicationRecord
    has_many :roles
    has_many :permissions

    scope :ordered, -> {order(name: :asc)}

    def self.active?(identifier)
        find_by_identifier(identifier).active
    end
end
