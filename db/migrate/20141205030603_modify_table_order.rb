;class ModifyTableOrder < ActiveRecord::Migration
  def change
  	drop_table "orders"
  	drop_table "orders_instruments"
  	drop_table "orders_states"
  	
  	 create_table "orders", force: true do |t|
	    t.integer  "user_id"		# 预约用户id
	    t.datetime "create_time"	# 订单产生时间
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	
	  create_table "orders_instruments", force: true do |t|
	    t.integer  "order_id"
	    t.integer  "instrument_id"
	    t.string   "order_time"		# 预约日期
	    t.string   "part"			# 预约时间段
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	
	  create_table "orders_states", force: true do |t|
	    t.integer  "order_id"
	    t.string   "state"
	    t.datetime "create_time"	# 状态产生时间
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
  end
end
