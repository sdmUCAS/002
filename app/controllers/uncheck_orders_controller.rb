#encoding: utf-8
class UncheckOrdersController < ApplicationController
  
  # GET /provider_orders
  # GET /provider_orders.json
  def index
    @uncheck_orders = Order.where('state_value = 1').order('create_time DESC').page(params[:page]).per_page(5)
  end

  # 同意预约
  def agree_apointment
    if params[:id] != nil
      @uncheck_order = Order.find(params[:id])
      Order.transaction do
      	@uncheck_order.orders_states << OrdersState.new(:order_id=>params[:id].to_i, :state=>"同意预约", :create_time=>Time.now)
      	@uncheck_order.update(state_value:2)
  	  end
	end
	redirect_to uncheck_orders_path
  end
  
end
