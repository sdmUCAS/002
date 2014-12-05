class CreateUncheckOrders < ActiveRecord::Migration
  def change
    create_table :uncheck_orders do |t|

      t.timestamps
    end
  end
end
