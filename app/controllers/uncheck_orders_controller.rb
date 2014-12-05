class UncheckOrdersController < ApplicationController
  
  # GET /provider_orders
  # GET /provider_orders.json
  def index
    @uncheck_orders = UncheckOrder.all
  end

  # 同意预约
  def agree_apointment
    if params[:id] != nil
      UncheckOrder.update(params[:id])
	end
	redirect_to uncheck_orders_path
  end
  
end
