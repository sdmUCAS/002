class AddToTable3 < ActiveRecord::Migration
  def change
  	create_table "instruments", force: true do |t|
  		t.string :instrument_id
  		t.string :department_id
  		t.string :username
  		t.string :image_url
  		t.string :name
  		t.string :type_name
  		t.string :type
  		t.string :bought_time
  		t.string :bought_price
  		t.string :function
  		t.string :place
  		t.string :status
  		t.string :price
  		t.string :description
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  end
end
