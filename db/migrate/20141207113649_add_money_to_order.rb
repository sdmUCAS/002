class AddMoneyToOrder < ActiveRecord::Migration
  def change
  	add_column :orders_instruments, :money, :decimal, :precision => 10, :scale=>2	
  end
end
