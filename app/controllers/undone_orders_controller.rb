#encoding: utf-8
class UndoneOrdersController < ApplicationController
	
  # GET /undone_orders
  # GET /undone_orders.json
  def index
  	# 分页
    @undone_orders = Order.where('state_value > 1').order('create_time DESC').page(params[:page]).per_page(5)
  end

  # GET /undone_orders/1/edit
  def edit
  	@undone_order = Order.find(params[:id])
  end

  def account
    if params[:money] == nil
    	@money = 100
    else
    	@money = params[:money] 
	end
	  	
    @undone_order = Order.find(params[:id])
  	if params[:id] != nil && @money != nil
  	  if @undone_order.state_value == 4
  	    Order.transaction do  
          @undone_order.orders_states << OrdersState.new(:order_id=>params[:id].to_i, :state=>"提交结算(共计 " + @money.to_s + " 元)", :create_time=>Time.now)
          @undone_order.update(state_value:5)
          oi = @undone_order.orders_instruments.find_by_order_id(@undone_order.id)
          oi.money =  @money
          oi.save
        end
      end
	end
	redirect_to edit_undone_order_path(@undone_order)
  end

  
  # 刷卡开机
  def startup
  	@undone_order = Order.find(params[:id])
  	if params[:id] != nil
  	  if @undone_order.state_value == 2
  	    Order.transaction do  
          @undone_order.orders_states << OrdersState.new(:order_id=>params[:id].to_i, :state=>"刷卡开机", :create_time=>Time.now)
          @undone_order.update(state_value:3)
        end
      end
	end
	redirect_to edit_undone_order_path(@undone_order)
  end
  
  # 刷卡关机
  def closedown
  	@undone_order = Order.find(params[:id])
  	if params[:id] != nil
  	  if @undone_order.state_value == 3 
  	    Order.transaction do  
          @undone_order.orders_states << OrdersState.new(:order_id=>params[:id].to_i, :state=>"刷卡关机", :create_time=>Time.now)
          @undone_order.update(state_value:4)
        end
      end
	end
	redirect_to edit_undone_order_path(@undone_order)
  end

end
