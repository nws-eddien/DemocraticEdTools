class CreateGroupDecisionMakingUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :group_decision_making_units do |t|
      t.belongs_to :group
      t.belongs_to :decision_making_unit
      t.timestamps
    end
  end
end
