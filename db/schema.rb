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

ActiveRecord::Schema.define(version: 20160704015834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ride_schedules", force: :cascade do |t|
    t.integer  "travel_method_id"
    t.time     "starts_at"
    t.integer  "interval_minutes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["travel_method_id"], name: "index_ride_schedules_on_travel_method_id", using: :btree
  end

  create_table "travel_methods", force: :cascade do |t|
    t.string "name"
    t.string "description"
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

  add_foreign_key "ride_schedules", "travel_methods"
end
