class CategoriaQueixasController < ApplicationController
  before_action :set_categoria_queixa, only: [:show, :edit, :update, :destroy]

  # GET /categoria_queixas
  def index
    @q = CategoriaQueixa.all.ransack(params[:q])
    @categoria_queixas = @q.result.page(params[:page])
  end

  # GET /categoria_queixas/1
  def show
  end

  # GET /categoria_queixas/new
  def new
    @categoria_queixa = CategoriaQueixa.new
  end

  # GET /categoria_queixas/1/edit
  def edit
  end

  # POST /categoria_queixas
  def create
    @categoria_queixa = CategoriaQueixa.new(categoria_queixa_params)

    if @categoria_queixa.save
      redirect_to @categoria_queixa, notice: 'Categoria queixa was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categoria_queixas/1
  def update
    if @categoria_queixa.update(categoria_queixa_params)
      redirect_to @categoria_queixa, notice: 'Categoria queixa was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categoria_queixas/1
  def destroy
    @categoria_queixa.destroy
    redirect_to categoria_queixas_url, notice: 'Categoria queixa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_queixa
      @categoria_queixa = CategoriaQueixa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def categoria_queixa_params
      params.require(:categoria_queixa).permit(:nome)
    end
end
