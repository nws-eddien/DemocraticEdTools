class RuleType < ApplicationRecord
  has_many :rule_types_rules
  has_many :rules, through: :rule_types_rules
  scope :ordered, -> {order(name: :asc)}

end
