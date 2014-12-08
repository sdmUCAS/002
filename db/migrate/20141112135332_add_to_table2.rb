class AddToTable2 < ActiveRecord::Migration
  def change
  	create_table "admins", force: true do |t|
  		t.string :login_name
  		t.string :password
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  end
end
