class ModifyTableOrder < ActiveRecord::Migration
  def change
  	drop_table "instruments"
  	
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
  end
end
