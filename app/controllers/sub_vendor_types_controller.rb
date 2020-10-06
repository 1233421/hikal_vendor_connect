class SubVendorTypesController < AdminsController
  before_action :set_sub_vendor_type, only: [:show, :edit, :update, :destroy]

  # GET /sub_vendor_types
  # GET /sub_vendor_types.json
  def index
    @sub_vendor_types = SubVendorType.all
  end

  # GET /sub_vendor_types/1
  # GET /sub_vendor_types/1.json
  def show
  end

  # GET /sub_vendor_types/new
  def new
    @sub_vendor_type = SubVendorType.new
  end

  # GET /sub_vendor_types/1/edit
  def edit
  end

  # POST /sub_vendor_types
  # POST /sub_vendor_types.json
  def create
    @sub_vendor_type = SubVendorType.new(sub_vendor_type_params)

    respond_to do |format|
      if @sub_vendor_type.save
        format.html { redirect_to @sub_vendor_type, notice: 'Sub vendor type was successfully created.' }
        format.json { render :show, status: :created, location: @sub_vendor_type }
      else
        format.html { render :new }
        format.json { render json: @sub_vendor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_vendor_types/1
  # PATCH/PUT /sub_vendor_types/1.json
  def update
    respond_to do |format|
      if @sub_vendor_type.update(sub_vendor_type_params)
        format.html { redirect_to @sub_vendor_type, notice: 'Sub vendor type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_vendor_type }
      else
        format.html { render :edit }
        format.json { render json: @sub_vendor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_vendor_types/1
  # DELETE /sub_vendor_types/1.json
  def destroy
    @sub_vendor_type.destroy
    respond_to do |format|
      format.html { redirect_to sub_vendor_types_url, notice: 'Sub vendor type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_vendor_type
      @sub_vendor_type = SubVendorType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_vendor_type_params
      params.require(:sub_vendor_type).permit(:name)
    end
end
