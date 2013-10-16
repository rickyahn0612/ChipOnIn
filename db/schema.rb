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

ActiveRecord::Schema.define(version: 20131016192138) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "date_time"
    t.string   "organization"
    t.string   "venue"
    t.text     "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "events", ["eventable_id", "eventable_type"], name: "index_events_on_eventable_id_and_eventable_type"

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "quantity_have"
    t.integer  "quantity_needed"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["itemable_type", "itemable_id"], name: "index_items_on_itemable_type_and_itemable_id"

  create_table "users", force: true do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "volunteers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "quantity_given"
    t.integer  "volunteerable_id"
    t.string   "volunteerable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  add_index "volunteers", ["volunteerable_type", "volunteerable_id"], name: "index_volunteers_on_volunteerable_type_and_volunteerable_id"

end
