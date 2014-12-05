class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  

  # GET /instruments
  # GET /instruments.json
  def index
    # @instruments = Instrument.all
    # 分页
    @instruments = Instrument.paginate(:page => params[:page], :per_page => 5)  
  end

  # GET /instruments/1
  # GET /instruments/1.json
  def show
  	@department_name = Department.find(@instrument.department_id).name
  	
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
  		
  def temp
  	 if @instrument.monday = 1
  	  if @instrument.morning != nil
  	  	@array = @instrument.morning.split(',')
      	@default_am_start_hour = @array[0].to_i
      	@default_am_end_hour = @array[1].to_i
      	for i in (@default_am_start_hour - 6)..(@default_am_end_hour - 6)
      	  @avaliable[i][0] = 1
  		end
  	  end
  	end
  end


  # GET /instruments/new
  def new
  	@depts = Department.all
    @instrument = Instrument.new
  end

  # GET /instruments/1/edit
  def edit
  	# @department_name = Department.find(@instrument.department_id).name
  	@depts = Department.all
  	@instrument.image_url == nil ? 
  		@image_tag = "imac_1-228x228.jpg" : @image_tag = @instrument.image_url
  	
  	edit_get_checked
  	edit_get_times
  end
  
  
  # 获取预约时间信息，设置check_box的check情况
  def edit_get_checked
  	@instrument.monday == '1' ?
    	  	@check1 = true : @check1 = false
    @instrument.tuesday == '1' ?
    	  	@check2 = true : @check2 = false
    @instrument.wednesday == '1' ?
    	  	@check3 = true : @check3 = false
  	@instrument.thursday == '1' ?
    	  	@check4 = true : @check4 = false
    @instrument.friday == '1' ?
    	  	@check5 = true : @check5 = false
    @instrument.saturday == '1' ?
    	  	@check6 = true : @check6 = false
    @instrument.sunday == '1' ?
    	  	@check7 = true : @check7 = false
	
    @instrument.morning == nil ?
    		@check8 = false : @check8 = true
    @instrument.afternoon == nil ?
    		@check9 = false : @check9 = true
    @instrument.night == nil ?
    		@check0 = false : @check0 = true
  end
  
  
  # 获取预约时间信息，设置时间
  def edit_get_times
  	if @instrument.morning == nil
  	  @default_am_start_hour = 8
  	  @default_am_end_hour = 12
  	else
  	  @array = @instrument.morning.split(',')
      @default_am_start_hour = @array[0].to_i
      @default_am_end_hour = @array[1].to_i
	end
	
	if @instrument.afternoon == nil
  	  @default_pm_start_hour = 14
  	  @default_pm_end_hour = 18
  	else
  	  @array = @instrument.afternoon.split(',')
      @default_pm_start_hour = @array[0].to_i
      @default_pm_end_hour = @array[1].to_i
	end
	
	if @instrument.night == nil
  	  @default_ng_start_hour = 18
  	  @default_ng_end_hour = 22
  	else
  	  @array = @instrument.night.split(',')
      @default_ng_start_hour = @array[0].to_i
      @default_ng_end_hour = @array[1].to_i
	end
  end

  # POST /instruments
  # POST /instruments.json
  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.image_url = upload
    
    set_available_time

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: 'Instrument was successfully created.' }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruments/1
  # PATCH/PUT /instruments/1.json
  def update
  	if params[:instrument][:picture] != nil
  	  @instrument.image_url = upload 
  	end
  	
    set_available_time
  	
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: 'Instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument.destroy
    respond_to do |format|
      format.html { redirect_to instruments_url, notice: 'Instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #upload a picture
  def upload
    @uploaded_io = params[:instrument][:picture]
    @img_url = Rails.root.join('app/assets/images/public', 'uploads', Time.now.to_i.to_s + @uploaded_io.original_filename);
    File.open(@img_url, 'wb') do |file|
      file.write(@uploaded_io.read)
    end
    return 'public/uploads/' + @uploaded_io.original_filename
  end
  
  # 根据view，设置可预约时间
  def set_available_time
	# morning available time
  	if params[:instrument][:tmp_morning] == '1'		# 允许上午预约
  	  if params[:date][:am_start_hour] != nil		# 设置了开始时间
  		@instrument.morning = params[:date][:am_start_hour]
  	  else											# 没有设置开始时间
  	  	@instrument.morning = '08'
  	  end
  	  if params[:date][:am_end_hour] != nil			# 设置了结束时间
  		@instrument.morning += ',' + params[:date][:am_end_hour]
  	  else											# 没有设置结束时间
  	  	@instrument.morning += ',' + '12'
  	  end
  	else											# 不允许上午预约
  		@instrument.morning = nil
  	end
  	
  	# afternoon available time
  	if params[:instrument][:tmp_afternoon] == '1'
  	  if params[:date][:pm_start_hour] != nil
  		@instrument.afternoon = params[:date][:pm_start_hour]
  	  else
  	  	@instrument.afternoon = '12'
  	  end
  	  if params[:date][:pm_end_hour] != nil
  		@instrument.afternoon += ',' + params[:date][:pm_end_hour]
  	  else
  	  	@instrument.afternoon += ',' + '18'
  	  end
  	else
  		@instrument.afternoon = nil
  	end
  	
  	# night available time
  	if params[:instrument][:tmp_night] == '1'
  	  if params[:date][:ng_start_hour] != nil
  		@instrument.night = params[:date][:ng_start_hour]
  	  else
  	  	@instrument.night = '18'
  	  end
  	  if params[:date][:ng_end_hour] != nil
  		@instrument.night += ',' + params[:date][:ng_end_hour]
  	  else
  	  	@instrument.night += ',' + '22'
  	  end
  	else
  		@instrument.night = nil
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
      params.require(:instrument).permit(:name, :type_name, :number, :image_url, :itype, :bought_time, :bought_price, :description, :department_id, 
      :place, :status, :price, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :morning, :afternoon, :night)
    end
    
end
