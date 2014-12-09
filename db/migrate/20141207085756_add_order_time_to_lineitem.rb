class AddOrderTimeToLineitem < ActiveRecord::Migration
  def change
  	add_column :line_items, :orderTime, :string
  end
end
