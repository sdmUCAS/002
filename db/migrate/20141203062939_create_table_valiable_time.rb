class CreateTableValiableTime < ActiveRecord::Migration
  def change
  	drop_table :valiable_times if table_exists?(:valiable_times)
  	
    create_table :valiable_times do |t|
    	t.string "moday"
    	t.string "tuesday"
    	t.string "wednesday"
    	t.string "tursday"
    	t.string "friday"
    	t.string "saturday"
    	t.string "sunday"
    	
    	t.integer "instrument_id"
    end
    
    
  end
end
