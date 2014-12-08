class AddDepartName < ActiveRecord::Migration
  def change
  	create_table "departments", force: true do |t|
    	t.string   "department_id"
    	t.string   "department_name"
    	t.string   "address"
    	t.string   "city"
    	t.datetime "created_at"
    	t.datetime "updated_at"
  	end
  end
  def self.up
  	add_column :instruments, :number, :
end
