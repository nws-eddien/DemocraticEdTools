MediaGlobalSetting.create({ :behavior_on_exceed => 1, :penalty_factor => 4, :daily_time_limit => 90, :max_active_users => 0})
puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")

