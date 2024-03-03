class CreateRuleContents < ActiveRecord::Migration[7.1]
  def change
    create_table :rule_contents do |t|
      t.belongs_to :rule
      t.text :text
      t.date :decided_at
      t.timestamps
    end
  end
end
