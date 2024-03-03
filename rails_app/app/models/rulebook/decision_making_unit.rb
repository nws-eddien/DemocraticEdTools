class DecisionMakingUnit < ApplicationRecord
  has_and_belongs_to_many :groups

  scope :ordered, -> {order(name: :asc)}

end
