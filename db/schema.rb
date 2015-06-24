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

ActiveRecord::Schema.define(version: 20150624083701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "responses", force: :cascade do |t|
    t.integer  "response_num",                      null: false
    t.integer  "thread_board_id",                   null: false
    t.string   "user_name",       default: "名無しさん"
    t.string   "user_email"
    t.string   "user_ipaddress"
    t.text     "comment",                           null: false
    t.boolean  "delete_flg",      default: false,   null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "responses", ["response_num", "thread_board_id"], name: "index_responses_on_response_num_and_thread_board_id", unique: true, using: :btree

  create_table "thread_boards", force: :cascade do |t|
    t.integer  "category_id",                    null: false
    t.string   "thread_name",                    null: false
    t.string   "user_ipaddress"
    t.string   "delete_pass",                    null: false
    t.boolean  "delete_flg",     default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
