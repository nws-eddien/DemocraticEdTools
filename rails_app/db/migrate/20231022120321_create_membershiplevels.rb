class CreateMembershiplevels < ActiveRecord::Migration[7.0]
  def change
    create_table :membershiplevels do |t|
      t.belongs_to :group
      t.string :name
      t.timestamps
    end
  end
end
