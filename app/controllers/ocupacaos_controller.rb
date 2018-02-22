class OcupacaosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_ocupacao, only: [:show, :edit, :update, :destroy]

  # GET /ocupacaos
  def index
    @q = Ocupacao.all.ransack(params[:q])
    @ocupacaos = @q.result.page(params[:page])
  end

  # GET /ocupacaos/1
  def show
  end

  # GET /ocupacaos/new
  def new
    @ocupacao = Ocupacao.new
  end

  # GET /ocupacaos/1/edit
  def edit
  end

  # POST /ocupacaos
  def create
    @ocupacao = Ocupacao.new(ocupacao_params)

    if @ocupacao.save
      redirect_to @ocupacao, notice: 'Ocupacao was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ocupacaos/1
  def update
    if @ocupacao.update(ocupacao_params)
      redirect_to @ocupacao, notice: 'Ocupacao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ocupacaos/1
  def destroy
    @ocupacao.destroy
    redirect_to ocupacaos_url, notice: 'Ocupacao was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocupacao
      @ocupacao = Ocupacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ocupacao_params
      params.require(:ocupacao).permit(:nome)
    end
end
