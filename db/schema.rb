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

ActiveRecord::Schema.define(version: 20170530174544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "special_instructions"
    t.integer  "event_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["event_id"], name: "index_locations_on_event_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.integer  "event_id"
    t.integer  "location_id"
    t.string   "task_location"
    t.string   "end_location"
    t.text     "description"
    t.integer  "priority"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["event_id"], name: "index_tasks_on_event_id", using: :btree
    t.index ["location_id"], name: "index_tasks_on_location_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "manager"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "tasks", "events"
  add_foreign_key "tasks", "locations"
end
