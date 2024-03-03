class CreateRuleCategoriesRules < ActiveRecord::Migration[7.1]
  def change
    create_table :rule_categories_rules, id: false do |t|
      t.belongs_to :rule
      t.belongs_to :rule_category
    end
  end
end
