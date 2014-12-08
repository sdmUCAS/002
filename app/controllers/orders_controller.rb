class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  # GET /orders
  # GET /orders.json
  def index
  	if current_user
    	@orders = Order.where(["user_id=?", current_user.id])
  	else
  		return
		end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
  	if request.post?
  		redirect_to(:action =>"create",:method=>"post")
  	else
    	if @cart.line_items.empty?
	  		redirect_to cart_path(@cart), notice: "Your cart is empty"
	  	return
  		end
		end
		@order = Order.new
		#if current_user
		#	@order.user = current_user
		#else
		#	redirect_to (:controller: 'sessions',:action: 'signin'),notice: "请登录之后进行结算"
		#end
		
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
		@order = Order.new
		userid = params[:order][:user_id]
		@order.user_id = userid
		@order.add_line_items_from_cart(@cart)
		respond_to do |format|
			if @order.save
				Cart.destroy(session[:cart_id])
				session[:cart_id] = nil
				format.html { redirect_to orders_path, notice: 'Thank you for your order.' }
				format.json { render action: 'show' , status: :created,location: @order }
			else
				format.html { render action: 'new' }
				format.json { render json: @order.errors,status: :unprocessable_entity }
			end
		end
	end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:order]
    end
end
