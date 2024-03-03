class CreateDecisionMakingUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :decision_making_units do |t|
      t.string :name
      t.timestamps
    end
  end
end
