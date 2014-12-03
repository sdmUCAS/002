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
  end

  # POST /instruments
  # POST /instruments.json
  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.image_url = upload

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
    @img_url = Rails.root.join('app/assets/images/public', 'uploads', @uploaded_io.original_filename);
    File.open(@img_url, 'wb') do |file|
      file.write(@uploaded_io.read)
    end
    return 'public/uploads/' + @uploaded_io.original_filename
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:name, :type_name, :number, :image_url, :itype, :bought_time, :bought_price, :description, :department_id, 
      :place, :status, :price)
    end
    
end
