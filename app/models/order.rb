#encoding=utf-8
class Order < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :orders_states, dependent: :destroy
  has_many :orders_instruments, dependent: :destroy
	PAYMENT_TYPES = [ "Check" , "Credit card" , "Purchase order" ]
	
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			orders_instruments << OrdersInstrument.new(:instrument_id=>item.instrument_id,:money=>item.total_price)
			line_items << item
		end
	end
	def add_state
		orders_states << OrdersState.new(:state=>'提交订单',:create_time=>Time.now)
	end
	def total_price
		total_price=0
		line_items.each do |item|
			total_price+= item.total_price
		end
		total_price
  end
end
