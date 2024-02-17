class CreateRolePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :role_permissions do |t|
      t.belongs_to :role
      t.belongs_to :permission
      t.timestamps
    end
  end
end
