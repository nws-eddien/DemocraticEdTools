class RuleContent < ApplicationRecord
  belongs_to :rule

  scope :ordered, -> {order(name: :asc)}

end
