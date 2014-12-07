#encoding: utf-8
class UncheckOrder < ActiveRecord::Base
	
  def self.all
  	@uncheck_orders = Order.find_by_sql("SELECT o.id AS order_id, o.create_time, oi.order_time, oi.part, i.image_url, i.name, i.type_name, i.number, u.name AS user_name, u.phone, u.email, d.name AS department_name
										  	FROM orders o, orders_instruments oi, instruments i, users u, departments d
										  	WHERE oi.order_id = o.id AND oi.instrument_id = i.id AND o.user_id = u.id AND u.department_id = d.id AND o.state_value = 1")
  	return @uncheck_orders
  end
  
  def self.update(order_id)
  	if order_id != nil
  	  transaction do  
  	    OrdersState.create(order_id: order_id, state: "同意预约", create_time: Time.now)
  	    Order.find_by_id(order_id).update(state_value:2)
  	  end
  	end
  end
  
end
