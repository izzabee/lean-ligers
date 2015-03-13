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

ActiveRecord::Schema.define(version: 20150312183323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentorships", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject",                    null: false
    t.string   "content",                    null: false
    t.integer  "mentor_id",                  null: false
    t.integer  "mentee_id",                  null: false
    t.boolean  "read",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "messages", ["mentee_id"], name: "index_messages_on_mentee_id", using: :btree
  add_index "messages", ["mentor_id"], name: "index_messages_on_mentor_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "type"
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.string   "industry",        null: false
    t.string   "interests",       null: false
    t.string   "advice"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
