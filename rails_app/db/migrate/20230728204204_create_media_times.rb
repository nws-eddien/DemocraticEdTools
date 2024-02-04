class CreateMediaTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :media_times do |t|
      t.integer :time_limit, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
