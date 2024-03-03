class RuleTypesRule < ApplicationRecord
  belongs_to :rule_type
  belongs_to :rule
end
