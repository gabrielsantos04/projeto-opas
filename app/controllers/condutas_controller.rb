class CondutasController < ApplicationController
  before_action :set_conduta, only: [:show, :edit, :update, :destroy]

  # GET /condutas
  def index
    @q = Conduta.all.ransack(params[:q])
    @conduta = @q.result.page(params[:page])
  end

  # GET /condutas/1
  def show
  end

  # GET /condutas/new
  def new
    @conduta = Conduta.new
  end

  # GET /condutas/1/edit
  def edit
  end

  # POST /condutas
  def create
    @conduta = Conduta.new(conduta_params)

    if @conduta.save
      redirect_to condutas_path, notice: 'Condutum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /condutas/1
  def update
    if @conduta.update(conduta_params)
      redirect_to condutas_path, notice: 'Condutum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /condutas/1
  def destroy
    @conduta.destroy
    redirect_to condutas_path, notice: 'Condutum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conduta
      @conduta = Conduta.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conduta_params
      params.require(:conduta).permit(:nome)
    end
end
