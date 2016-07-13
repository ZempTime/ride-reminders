# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160704021435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarms", force: :cascade do |t|
    t.integer  "user_id"
    t.time     "departs_at",             null: false
    t.integer  "travel_delay_minutes",   null: false
    t.integer  "heads_up_delay_minutes", null: false
    t.integer  "travel_method_id"
    t.integer  "ride_schedule_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["ride_schedule_id"], name: "index_alarms_on_ride_schedule_id", using: :btree
    t.index ["travel_method_id"], name: "index_alarms_on_travel_method_id", using: :btree
    t.index ["user_id"], name: "index_alarms_on_user_id", using: :btree
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "notify_at",              null: false
    t.integer  "status",     default: 0
    t.integer  "alarm_id"
    t.string   "message",                null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["alarm_id"], name: "index_reminders_on_alarm_id", using: :btree
  end

  create_table "ride_schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "travel_method_id"
    t.time     "starts_at",        null: false
    t.integer  "interval_minutes", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["travel_method_id"], name: "index_ride_schedules_on_travel_method_id", using: :btree
    t.index ["user_id"], name: "index_ride_schedules_on_user_id", using: :btree
  end

  create_table "travel_methods", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "phone_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "weeks", force: :cascade do |t|
    t.boolean  "sunday",     default: false
    t.boolean  "monday",     default: false
    t.boolean  "tuesday",    default: false
    t.boolean  "wednesday",  default: false
    t.boolean  "thursday",   default: false
    t.boolean  "friday",     default: false
    t.boolean  "saturday",   default: false
    t.string   "owner_type"
    t.integer  "owner_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["owner_id", "owner_type"], name: "index_weeks_on_owner_id_and_owner_type", using: :btree
    t.index ["owner_type", "owner_id"], name: "index_weeks_on_owner_type_and_owner_id", using: :btree
  end

  add_foreign_key "alarms", "ride_schedules"
  add_foreign_key "alarms", "travel_methods"
  add_foreign_key "alarms", "users"
  add_foreign_key "reminders", "alarms"
  add_foreign_key "ride_schedules", "travel_methods"
  add_foreign_key "ride_schedules", "users"
end
