class CreateMediaBans < ActiveRecord::Migration[7.0]
  def change
    create_table :media_bans do |t|
      t.integer :ban_mode, default: 1
      t.integer :days_count, default: 1
      t.date :login_attempts, array: true, default: []
      t.date :ban_end
      t.date :ban_start
      t.belongs_to :media_time
      t.boolean :active, default: false
      t.boolean :ended, default: false
      t.timestamps
    end
  end
end
