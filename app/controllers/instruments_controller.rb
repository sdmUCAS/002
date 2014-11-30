class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  # GET /instruments
  # GET /instruments.json
  def index
    @instruments = Instrument.all
  end

  # GET /instruments/1
  # GET /instruments/1.json
  def show
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  # GET /instruments/1/edit
  def edit
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
      params.require(:instrument).permit(:name, :type_name, :number, :itype, :image_url, :description, :available_time, :price, :purchase_date, :purchase_price, :company, :location)
    end
    
end
