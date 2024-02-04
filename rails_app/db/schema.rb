# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_22_152717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "default_membershiplevel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_bans", force: :cascade do |t|
    t.integer "ban_mode", default: 1
    t.integer "days_count", default: 1
    t.date "login_attempts", default: [], array: true
    t.date "ban_end"
    t.date "ban_start"
    t.bigint "media_time_id"
    t.boolean "active", default: false
    t.boolean "ended", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_time_id"], name: "index_media_bans_on_media_time_id"
  end

  create_table "media_global_settings", force: :cascade do |t|
    t.integer "behavior_on_exceed", default: 0
    t.integer "daily_time_limit", default: 90
    t.integer "max_active_users", default: 0
    t.integer "penalty_factor", default: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_penalties", force: :cascade do |t|
    t.bigint "media_time_id"
    t.date "activated_at", default: "2024-02-04"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_time_id"], name: "index_media_penalties_on_media_time_id"
  end

  create_table "media_sessions", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean "active", default: true
    t.integer "final_duration"
    t.bigint "media_time_id"
    t.index ["media_time_id"], name: "index_media_sessions_on_media_time_id"
  end

  create_table "media_time_corrections", force: :cascade do |t|
    t.integer "correction_amount"
    t.bigint "media_time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_time_id"], name: "index_media_time_corrections_on_media_time_id"
  end

  create_table "media_times", force: :cascade do |t|
    t.integer "time_limit", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_media_times_on_user_id"
  end

  create_table "membershiplevels", force: :cascade do |t|
    t.bigint "group_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_membershiplevels_on_group_id"
  end

  create_table "membershiplevels_roles", id: false, force: :cascade do |t|
    t.bigint "membershiplevel_id"
    t.bigint "role_id"
    t.index ["membershiplevel_id"], name: "index_membershiplevels_roles_on_membershiplevel_id"
    t.index ["role_id"], name: "index_membershiplevels_roles_on_role_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "membershiplevel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membershiplevel_id"], name: "index_memberships_on_membershiplevel_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "permissions", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "app_id"
    t.index ["app_id"], name: "index_roles_on_app_id"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name", default: "", null: false
    t.string "pin"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["pin"], name: "index_users_on_pin", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
