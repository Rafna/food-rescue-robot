# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150623180213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.integer "volunteer_id"
    t.date    "start_date"
    t.date    "stop_date"
    t.boolean "active",       default: true
    t.text    "comments"
  end

  create_table "absences_logs", force: :cascade do |t|
    t.integer "absence_id"
    t.integer "log_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "region_id"
    t.boolean  "admin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "assignments", ["region_id"], name: "index_assignments_on_region_id", using: :btree
  add_index "assignments", ["volunteer_id"], name: "index_assignments_on_volunteer_id", using: :btree

  create_table "cell_carriers", force: :cascade do |t|
    t.string "name",   limit: 255
    t.string "format", limit: 255
  end

  create_table "food_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "region_id"
    t.boolean  "active",                 default: true, null: false
  end

  create_table "food_types_schedules", force: :cascade do |t|
    t.integer "food_type_id"
    t.integer "schedule_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "recip_category",         limit: 255
    t.string   "donor_type",             limit: 255
    t.text     "address"
    t.string   "name",                   limit: 255
    t.decimal  "lat"
    t.decimal  "lng"
    t.text     "contact"
    t.string   "website",                limit: 255
    t.text     "admin_notes"
    t.text     "public_notes"
    t.text     "hours"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "region_id"
    t.string   "twitter_handle",         limit: 255
    t.string   "receipt_key",            limit: 255
    t.text     "detailed_hours_json"
    t.text     "email"
    t.text     "phone"
    t.text     "equipment_storage_info"
    t.text     "food_storage_info"
    t.text     "entry_info"
    t.text     "exit_info"
    t.text     "onsite_contact_info"
    t.boolean  "active",                             default: true,  null: false
    t.boolean  "is_hub",                             default: false, null: false
    t.integer  "location_type",                      default: 0
  end

  create_table "log_parts", force: :cascade do |t|
    t.integer  "log_id"
    t.integer  "food_type_id"
    t.boolean  "required"
    t.decimal  "weight"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "count"
    t.text     "description"
  end

  add_index "log_parts", ["food_type_id"], name: "index_log_parts_on_food_type_id", using: :btree
  add_index "log_parts", ["log_id"], name: "index_log_parts_on_log_id", using: :btree

  create_table "log_recipients", force: :cascade do |t|
    t.integer "log_id"
    t.integer "recipient_id"
  end

  create_table "log_volunteers", force: :cascade do |t|
    t.integer  "log_id"
    t.integer  "volunteer_id"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "covering"
  end

  add_index "log_volunteers", ["log_id"], name: "index_log_volunteers_on_log_id", using: :btree
  add_index "log_volunteers", ["volunteer_id"], name: "index_log_volunteers_on_volunteer_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.date     "when"
    t.text     "notes"
    t.integer  "num_reminders"
    t.boolean  "flag_for_admin"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "donor_id"
    t.integer  "transport_type_id"
    t.integer  "region_id"
    t.boolean  "complete",                      default: false
    t.integer  "scale_type_id"
    t.string   "weight_unit",       limit: 255
    t.integer  "schedule_chain_id"
    t.integer  "num_volunteers"
    t.integer  "why_zero"
    t.decimal  "hours_spent"
  end

  create_table "regions", force: :cascade do |t|
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "name",                        limit: 255
    t.string   "website",                     limit: 255
    t.text     "address"
    t.text     "notes"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "handbook_url",                limit: 255
    t.integer  "prior_lbs_rescued"
    t.integer  "prior_num_pickups"
    t.string   "twitter_key",                 limit: 255
    t.string   "twitter_secret",              limit: 255
    t.string   "twitter_token",               limit: 255
    t.string   "twitter_token_secret",        limit: 255
    t.integer  "twitter_last_poundage"
    t.datetime "twitter_last_timestamp"
    t.string   "title",                       limit: 255
    t.string   "tagline",                     limit: 255
    t.string   "logo_file_name",              limit: 255
    t.string   "logo_content_type",           limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "phone",                       limit: 255
    t.string   "tax_id",                      limit: 255
    t.text     "welcome_email_text"
    t.text     "splash_html"
    t.string   "weight_unit",                 limit: 255, default: "pound", null: false
    t.text     "time_zone"
    t.string   "volunteer_coordinator_email", limit: 255
    t.boolean  "post_pickup_emails",                      default: false
    t.boolean  "unschedule_self",                         default: false
  end

  create_table "scale_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "weight_unit", limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "region_id"
    t.boolean  "active",                  default: true, null: false
  end

  create_table "schedule_chains", force: :cascade do |t|
    t.time    "detailed_start_time"
    t.time    "detailed_stop_time"
    t.date    "detailed_date"
    t.integer "transport_type_id"
    t.boolean "backup"
    t.boolean "temporary"
    t.boolean "irregular"
    t.integer "difficulty_rating"
    t.integer "hilliness"
    t.integer "scale_type_id"
    t.integer "region_id"
    t.integer "schedules_id"
    t.text    "frequency"
    t.integer "day_of_week"
    t.integer "expected_weight"
    t.text    "public_notes"
    t.text    "admin_notes"
    t.integer "num_volunteers",      default: 1,    null: false
    t.boolean "active",              default: true, null: false
  end

  create_table "schedule_parts", force: :cascade do |t|
    t.integer  "schedule_id"
    t.integer  "food_type_id"
    t.boolean  "required"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "schedule_parts", ["food_type_id"], name: "index_schedule_parts_on_food_type_id", using: :btree
  add_index "schedule_parts", ["schedule_id"], name: "index_schedule_parts_on_schedule_id", using: :btree

  create_table "schedule_volunteers", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.boolean  "active",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "schedule_chain_id"
  end

  add_index "schedule_volunteers", ["volunteer_id"], name: "index_schedule_volunteers_on_volunteer_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "schedule_chain_id"
    t.integer  "location_id"
    t.integer  "position"
  end

  create_table "transport_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                 default: true, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "name",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "preferred_contact",      limit: 255
    t.boolean  "has_car"
    t.text     "admin_notes"
    t.text     "pickup_prefs"
    t.boolean  "is_disabled"
    t.boolean  "on_email_list"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "admin",                              default: false
    t.integer  "transport_type_id"
    t.integer  "cell_carrier_id"
    t.boolean  "sms_too",                            default: false
    t.boolean  "pre_reminders_too",                  default: false
    t.string   "photo_file_name",        limit: 255
    t.string   "photo_content_type",     limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "get_sncs_email",                     default: false, null: false
    t.boolean  "waiver_signed",                      default: false, null: false
    t.datetime "waiver_signed_at"
    t.boolean  "assigned",                           default: false, null: false
    t.integer  "requested_region_id"
    t.string   "authentication_token",   limit: 255
    t.boolean  "active",                             default: true,  null: false
  end

  add_index "volunteers", ["email"], name: "index_volunteers_on_email", unique: true, using: :btree
  add_index "volunteers", ["reset_password_token"], name: "index_volunteers_on_reset_password_token", unique: true, using: :btree

end
