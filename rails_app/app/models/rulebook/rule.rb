class Rule < ApplicationRecord
  has_many :rule_categories_rules
  has_many :rule_categories, through: :rule_categories_rules
  has_many :rule_types_rules
  has_many :rule_types, through: :rule_types_rules
  has_many :rooms_rules
  has_many :rooms, through: :rooms_rules


  has_many :rule_contents

  scope :ordered, -> {order(id: :asc)}

end
