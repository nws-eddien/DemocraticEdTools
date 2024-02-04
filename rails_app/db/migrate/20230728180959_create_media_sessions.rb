class CreateMediaSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :media_sessions do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.boolean :active, default: :true
      t.integer :final_duration
      t.belongs_to :media_time
    end
  end
end
