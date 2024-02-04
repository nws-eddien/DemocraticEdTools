class CreateMembershiplevelsRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :membershiplevels_roles, id: false do |t|
      t.belongs_to :membershiplevel
      t.belongs_to :role
    end
  end
end
