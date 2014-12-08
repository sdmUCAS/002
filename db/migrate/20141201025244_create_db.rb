class CreateDb < ActiveRecord::Migration
  def change
  	
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
	    t.string   "name"										# 设备名称
	    t.string   "type_name"									# 设备型号
	    t.string   "number"										# 设备编号
	    t.string   "image_url"									# 图片
	    t.string   "itype"										# 设备类型
	    t.string   "bought_time" 								# 购置时间
	    t.decimal  "bought_price", :precision => 12, :scale=>2  # 购置金额
	    t.string   "description"								# 设备描述（主要功能）
	    t.string   "available_time"								# 仪器可用时间
	    t.integer  "department_id"								# 所属单位
	    t.integer  "user_id"									# 所属用户
	    t.string   "place"										# 放置地点
	    t.string   "status"										# 工作状态（正常/故障/维修/报废/停用）
	    t.decimal  "price", :precision => 12, :scale=>2		    # 预约价格（以半小时为节点）
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
	    t.integer   "department_id"
	  end
	
	  create_table "users_cards", force: true do |t|
	    t.string "card_id"
	    t.string "username"
	  end
  end
end
