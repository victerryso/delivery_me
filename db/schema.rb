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

ActiveRecord::Schema.define(version: 20140817072819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "courier_id"
    t.string   "name"
    t.text     "description"
    t.time     "time"
    t.integer  "price"
    t.string   "from_name"
    t.string   "from_address"
    t.float    "from_lat"
    t.float    "from_lng"
    t.string   "to_name"
    t.string   "to_address"
    t.float    "to_lat"
    t.float    "to_lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name",            default: "Someone"
    t.text     "image",           default: "http://www.fedical.com/wp-content/uploads/2014/04/Happy-face-coloring-pages.jpg"
    t.integer  "credibility",     default: 0
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
