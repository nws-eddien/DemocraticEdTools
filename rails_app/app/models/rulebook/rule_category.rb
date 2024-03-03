class RuleCategory < ApplicationRecord
  has_many :rule_categories_rules
  has_many :rules, through: :rule_categories_rules

  scope :ordered, -> {order(name: :asc)}

end
