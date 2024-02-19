class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :identifier
      t.boolean :active, default: true
      t.timestamps
    end
    add_index :apps, :identifier, unique:true
    add_index :apps, :name, unique:true
  end
end
