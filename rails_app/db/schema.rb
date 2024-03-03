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

ActiveRecord::Schema[7.1].define(version: 2024_03_03_225220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_apps_on_identifier", unique: true
    t.index ["name"], name: "index_apps_on_name", unique: true
  end

  create_table "decision_making_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_decision_making_units", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "decision_making_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decision_making_unit_id"], name: "index_group_decision_making_units_on_decision_making_unit_id"
    t.index ["group_id"], name: "index_group_decision_making_units_on_group_id"
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
    t.date "activated_at", default: "2024-03-03"
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
    t.index ["user_id", "membershiplevel_id"], name: "index_memberships_on_user_id_and_membershiplevel_id", unique: true
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "app_id"
    t.string "name"
    t.string "identifier"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_permissions_on_app_id"
    t.index ["identifier"], name: "index_permissions_on_identifier", unique: true
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
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

  create_table "room_rules", id: false, force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "rule_id"
    t.index ["room_id"], name: "index_room_rules_on_room_id"
    t.index ["rule_id"], name: "index_room_rules_on_rule_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rule_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rule_categories_rules", id: false, force: :cascade do |t|
    t.bigint "rule_id"
    t.bigint "rule_category_id"
    t.index ["rule_category_id"], name: "index_rule_categories_rules_on_rule_category_id"
    t.index ["rule_id"], name: "index_rule_categories_rules_on_rule_id"
  end

  create_table "rule_contents", force: :cascade do |t|
    t.bigint "rule_id"
    t.text "text"
    t.date "decided_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_rule_contents_on_rule_id"
  end

  create_table "rule_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rule_types_rules", id: false, force: :cascade do |t|
    t.bigint "rule_type_id"
    t.bigint "rule_id"
    t.index ["rule_id"], name: "index_rule_types_rules_on_rule_id"
    t.index ["rule_type_id"], name: "index_rule_types_rules_on_rule_type_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name", default: "", null: false
    t.string "pin"
    t.integer "pin_length", default: 5
    t.boolean "easy_pin", default: false
    t.string "encrypted_password"
    t.boolean "is_super_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["pin"], name: "index_users_on_pin", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
