class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.string :permissions, array: true, default: []
      t.timestamps
      t.belongs_to :app
    end
  end
end
