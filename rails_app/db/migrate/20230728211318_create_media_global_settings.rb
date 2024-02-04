class CreateMediaGlobalSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :media_global_settings do |t|
      t.integer :behavior_on_exceed, default: 0
      t.integer :daily_time_limit, default: 90
      t.integer :max_active_users, default: 0
      t.integer :penalty_factor, default: 4
      t.timestamps
    end
  end
end
