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

ActiveRecord::Schema.define(version: 20141209170746) do

  create_table "admins", force: true do |t|
    t.string   "login_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.string   "card_id"
    t.string   "belong_to"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "cotent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "department_id"
    t.string   "address"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.string   "type_name"
    t.string   "number"
    t.string   "image_url"
    t.string   "itype"
    t.string   "bought_time"
    t.decimal  "bought_price",   precision: 12, scale: 2
    t.string   "description"
    t.string   "available_time"
    t.integer  "department_id"
    t.integer  "user_id"
    t.string   "place"
    t.string   "status"
    t.decimal  "price",          precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "saturday"
    t.string   "sunday"
    t.string   "morning"
    t.string   "afternoon"
    t.string   "night"
  end

  create_table "instruments_comments", force: true do |t|
    t.string   "instrument_id"
    t.string   "order_id"
    t.string   "username"
    t.string   "content"
    t.datetime "comment_time"
    t.string   "anonymous"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "instrument_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",      default: 1
    t.integer  "order_id"
    t.string   "orderTime"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["instrument_id"], name: "index_line_items_on_instrument_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "create_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_value"
  end

  create_table "orders_instruments", force: true do |t|
    t.integer  "order_id"
    t.integer  "instrument_id"
    t.string   "order_time"
    t.string   "part"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "money",         precision: 10, scale: 2
  end

  create_table "orders_states", force: true do |t|
    t.integer  "order_id"
    t.string   "state"
    t.datetime "create_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.string   "sex"
    t.string   "uid"
    t.string   "phone"
    t.string   "email"
    t.string   "utype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "users_cards", force: true do |t|
    t.string "card_id"
    t.string "username"
  end

  create_table "valiable_times", force: true do |t|
    t.string  "moday"
    t.string  "tuesday"
    t.string  "wednesday"
    t.string  "tursday"
    t.string  "friday"
    t.string  "saturday"
    t.string  "sunday"
    t.integer "instrument_id"
  end

end
