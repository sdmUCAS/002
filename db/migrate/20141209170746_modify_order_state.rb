class ModifyOrderState < ActiveRecord::Migration
  def change
  	drop_table 'orders_states'
  	create_table "orders_states", force: true do |t|
    	t.integer  "order_id"
    	t.string   "state"
    	t.datetime "create_time"
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  end
end
