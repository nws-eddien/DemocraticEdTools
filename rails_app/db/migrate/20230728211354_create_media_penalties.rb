class CreateMediaPenalties < ActiveRecord::Migration[7.0]
  def change
    create_table :media_penalties do |t|
      t.belongs_to :media_time
      t.date :activated_at, default: Date.today
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
