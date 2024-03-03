class CreateRoomsRules < ActiveRecord::Migration[7.1]
  def change
    create_table :room_rules, id: false do |t|
      t.belongs_to :room
      t.belongs_to :rule
    end
  end
end
