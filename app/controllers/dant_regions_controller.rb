class DantRegionsController < ApplicationController
  before_action :set_dant_region, only: [:show, :edit, :update, :destroy]

  # GET /dant_regions
  def index
    @q = DantRegion.all.ransack(params[:q])
    @dant_regions = @q.result.page(params[:page])
  end

  # GET /dant_regions/1
  def show
  end

  # GET /dant_regions/new
  def new
    @dant_region = DantRegion.new
  end

  # GET /dant_regions/1/edit
  def edit
  end

  # POST /dant_regions
  def create
    @dant_region = DantRegion.new(dant_region_params)

    if @dant_region.save
      redirect_to @dant_region, notice: 'Dant region was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dant_regions/1
  def update
    if @dant_region.update(dant_region_params)
      redirect_to @dant_region, notice: 'Dant region was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dant_regions/1
  def destroy
    @dant_region.destroy
    redirect_to dant_regions_url, notice: 'Dant region was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_region
      @dant_region = DantRegion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_region_params
      params.require(:dant_region).permit(:nome)
    end
end
