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

ActiveRecord::Schema.define(version: 20160302133347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "library_locations", force: :cascade do |t|
    t.string   "city_name"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "library_locations", ["user_id"], name: "index_library_locations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "volumes", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "page_count"
    t.integer  "published_date"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "volumes", ["user_id"], name: "index_volumes_on_user_id", using: :btree

  add_foreign_key "library_locations", "users"
  add_foreign_key "volumes", "users"
end
