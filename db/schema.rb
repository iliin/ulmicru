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

ActiveRecord::Schema.define(version: 20150321230139) do

  create_table "activity_lines", force: :cascade do |t|
    t.string   "title"
    t.datetime "found_date"
    t.string   "activity_type"
    t.string   "description"
    t.integer  "creator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "state"
  end

  create_table "authentications", force: :cascade do |t|
    t.text     "provider"
    t.text     "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string   "photo"
    t.string   "link"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
  end

  create_table "event_registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "main_photo"
    t.integer  "creator_id"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.string   "event_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
    t.text     "patronymic"
    t.integer  "user_id"
    t.text     "motto"
    t.integer  "ticket"
    t.integer  "parent_id"
    t.text     "mobile_phone"
    t.datetime "birth_date"
    t.text     "home_adress"
    t.text     "municipality"
    t.text     "locality"
    t.text     "avatar"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "state"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "role"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "state"
  end

end
