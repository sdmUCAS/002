#encoding: utf-8
class UncheckOrder < ActiveRecord::Base
	
  def self.all
  	@uncheck_orders = Order.find_by_sql("SELECT o.id AS order_id, o.create_time, oi.order_time, oi.part, i.image_url, i.name, i.type_name, i.number, u.name AS user_name, u.phone, u.email, d.name AS department_name
										  	FROM orders o, orders_instruments oi, instruments i, users u, departments d, orders_states os
										  	WHERE oi.order_id = o.id AND oi.instrument_id = i.id AND o.user_id = u.id AND u.department_id = d.id AND os.order_id = o.id AND os.state = '提交订单'")
  	return @uncheck_orders
  end
  
  def self.update(order_id)
  	if order_id != nil
  	  OrdersState.create(order_id: order_id, state: "仪器提供方同意预约", create_time: Time.now)
  	end
  end
  
end
