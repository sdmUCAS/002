class CombineTable < ActiveRecord::Migration
  def change
  	drop_table "orders", "orders_instruments"
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
end
