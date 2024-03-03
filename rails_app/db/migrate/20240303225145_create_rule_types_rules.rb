class CreateRuleTypesRules < ActiveRecord::Migration[7.1]
  def change
    create_table :rule_types_rules, id: false do |t|
      t.belongs_to :rule_type
      t.belongs_to :rule
    end
  end
end
