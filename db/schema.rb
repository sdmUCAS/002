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

ActiveRecord::Schema.define(version: 20141201025244) do

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

  create_table "comments", force: true do |t|
    t.string   "cotent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
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

  create_table "orders", force: true do |t|
    t.string   "order_id"
    t.string   "username"
    t.datetime "create_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders_instruments", force: true do |t|
    t.string   "order_id"
    t.string   "instrument_id"
    t.datetime "order_time"
    t.string   "part"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders_states", force: true do |t|
    t.string   "order_id"
    t.string   "state"
    t.datetime "create_time"
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
  end

  create_table "users_cards", force: true do |t|
    t.string "card_id"
    t.string "username"
  end

end
