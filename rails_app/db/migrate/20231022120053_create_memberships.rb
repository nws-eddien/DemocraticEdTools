class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :membershiplevel
      t.timestamps
    end
    add_index :memberships, [:user_id, :membershiplevel_id], unique: true
  end
end
