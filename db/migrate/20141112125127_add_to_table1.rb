class AddToTable1 < ActiveRecord::Migration
  def change
  	create_table "orders", force: true do |t|
  		t.string :order_id
  		t.string :username
  		t.datetime :create_time
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  	create_table "instruments", force: true do |t|
  		t.string :instrument_id
  		t.string :department_id
  		t.string :name
  		t.string :type_number
  		t.string :type
  		t.string :bought_time
  		t.string :bought_price
  		t.string :function
  		t.string :place
  		t.string :status
  		t.string :price
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  	create_table "instruments_comments", force: true do |t|
  		t.string :instrument_id
  		t.string :order_id
  		t.string :username
  		t.string :content
  		t.datetime :comment_time
  		t.string :anonymous
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  	create_table "orders_states", force: true do |t|
  		t.string :order_id
  		t.string :state
  		t.datetime :create_time
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  	create_table "orders_instruments", force: true do |t|
  		t.string :order_id
  		t.string :instrument_id
  		t.datetime :order_time
  		t.string :part
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  	end
end
