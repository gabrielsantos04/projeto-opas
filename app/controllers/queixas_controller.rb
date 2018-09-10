#Classe que controla as açoes da Queixas
class QueixasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_queixa, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /queixas
  def index
    @q = Queixa.all.ransack(params[:q])
    @queixas = @q.result.page(params[:page])
  end

  # GET /queixas/1
  def show
  end

  # GET /queixas/new
  def new
    @queixa = Queixa.new
  end

  # GET /queixas/1/edit
  def edit
  end

  # POST /queixas
  def create
    @queixa = Queixa.new(queixa_params)

    if @queixa.save
      redirect_to queixas_path, notice: 'Queixa criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /queixas/1
  def update
    if @queixa.update(queixa_params)
      redirect_to @queixa, notice: 'Queixa was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /queixas/1
  def destroy
    @queixa.destroy
    redirect_to queixas_url, notice: 'Queixa was successfully destroyed.'
  end



  private

  #Método utilizado para setar os objetos utilizados no formulário
  def set_combos
    @categorias = CategoriaQueixa.all.map{|a| [a.nome,a.id]}
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_queixa
      @queixa = Queixa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def queixa_params
      params.require(:queixa).permit(:nome, :categoria,:categoria_queixa_id)
    end
end
