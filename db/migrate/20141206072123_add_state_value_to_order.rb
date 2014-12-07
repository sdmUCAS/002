class AddStateValueToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :state_value, :integer
  end
end
