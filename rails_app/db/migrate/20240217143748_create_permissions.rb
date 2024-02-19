class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|
      t.belongs_to :app
      t.string :name
      t.string :identifier
      t.text :description
      t.timestamps
    end
    add_index :permissions, :name, unique: true
    add_index :permissions, :identifier, unique: true
  end
end
