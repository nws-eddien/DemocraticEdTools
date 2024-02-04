class CreateMediaTimeCorrections < ActiveRecord::Migration[7.0]
  def change
    create_table :media_time_corrections do |t|
      t.integer :correction_amount
      t.belongs_to :media_time
      t.timestamps
    end
  end
end
