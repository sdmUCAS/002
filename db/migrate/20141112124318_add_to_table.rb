class AddToTable < ActiveRecord::Migration
  def change
  	create_table "departments", force: true do |t|
  		t.string :department_id
  		t.string :address
  		t.string :city
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end

  
  	end
  end
end
