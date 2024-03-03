class RuleCategoriesRule < ApplicationRecord
  belongs_to :rule_category
  belongs_to :rule
end
