class Room < ApplicationRecord
  has_many :room_rules
  has_many :rules, through: :room_rules

  scope :ordered, -> {order(name: :asc)}

end
