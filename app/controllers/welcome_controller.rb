class WelcomeController < ApplicationController
	include CurrentCart
  before_action :set_cart, only: [:create]
  def login
  	if request.post?
  	   user = params[:user]
  	   @user = User.find_by username: user[:username],password: user[:password]
  	   if @user
       	 redirect_to(:action =>"index")
   	   end
    end 
  end
  def index
    #@instruments = Instrument.all
    @instruments = Instrument.paginate :page => params[:page]||1, :per_page => 6
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @instruments }
    end
  end
  def show
  	if request.post?
  		redirect_to(:action =>"create",:method=>"post")
  	else
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
  end
  
  def create
  	instrument = Instrument.find(params[:line_item][:id].to_i)
  	ordertime = params[:line_item][:orderTime]
  	@line_item = @cart.add_instrument(instrument.id)
  	#这里少一句给购物车中的设备的预约时间进行赋值的语句，就新用一个字段吧，要不然来回解析太麻烦
		@line_item.orderTime = ordertime
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart}
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def self.show_init_available_time(index)
  	@available_times = []
  	for i in 6..21
      @available_times << i.to_s + ":00"
	end
    return @available_times[index]
  end
  	
private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:name, :type_name, :image_url, :description, :price)
    end
end
