class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:create]
  
  def line_item_params
	params.require(:line_item).permit(:instrument_id)
  end
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  	@instrument = Instrument.find(params[:id])
  	@avaliable = Array.new(16){ Array.new(7)}
  	@week = [@instrument.monday, @instrument.tuesday, @instrument.wednesday, @instrument.thursday, 
  			 @instrument.friday, @instrument.saturday, @instrument.sunday  ]
  	@day = [ @instrument.morning, @instrument.afternoon, @instrument.night]

    for n in 0..6
  	  if @week[n] == '1'
  	    for k in 0..2
  	  	  if @day[k] != nil
  	        @array = @day[k].split(',')
      	    @start_hour = @array[0].to_i
      	    @end_hour = @array[1].to_i
      	    for i in (@start_hour - 6)..(@end_hour - 6 - 1)
      	      @avaliable[i][n] = 1
  		    end
  	  	  end
  	    end
  	  end
  	end
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
  	instrument = Instrument.find(params[:id])
  	@ordertime = params[:orderTime]
  	@line_item = @cart.add_instrument(instrument.id)
  	@line_item.orderTime = params[:orderTime]
		
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:instrument_id, :cart_id)
    end
end
