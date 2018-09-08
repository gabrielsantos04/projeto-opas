#Classe que controla as açoes da cidades
class CidadesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_cidade, only: [:show, :edit, :update, :destroy]

  # GET /cidades
  def index
    @q = Cidade.all.ransack(params[:q])
    @cidades = @q.result.page(params[:page])
  end

  # GET /cidades/1
  def show
  end

  # GET /cidades/new
  def new
    @cidade = Cidade.new
  end

  # GET /cidades/1/edit
  def edit
  end

  # POST /cidades
  def create
    @cidade = Cidade.new(cidade_params)

    if @cidade.save
      redirect_to @cidade, notice: 'Cidade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cidades/1
  def update
    if @cidade.update(cidade_params)
      redirect_to @cidade, notice: 'Cidade was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cidades/1
  def destroy
    @cidade.destroy
    redirect_to cidades_url, notice: 'Cidade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cidade
      @cidade = Cidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cidade_params
      params.require(:cidade).permit(:nome, :uf, :latitude, :longitude,:pacientes_count)
    end
end
