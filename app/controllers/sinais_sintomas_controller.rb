#Classe que controla as açoes da SinaisSintomas
class SinaisSintomasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_sinais_sintoma, only: [:show, :edit, :update, :destroy]

  # GET /sinais_sintomas
  def index
    @q = SinaisSintoma.all.ransack(params[:q])
    @sinais_sintomas = @q.result.page(params[:page])
  end

  # GET /sinais_sintomas/1
  def show
  end

  # GET /sinais_sintomas/new
  def new
    @sinais_sintoma = SinaisSintoma.new
  end

  # GET /sinais_sintomas/1/edit
  def edit
  end

  # POST /sinais_sintomas
  def create
    @sinais_sintoma = SinaisSintoma.new(sinais_sintoma_params)

    if @sinais_sintoma.save
      redirect_to sinais_sintomas_path, notice: 'Sinais/sintomas criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /sinais_sintomas/1
  def update
    if @sinais_sintoma.update(sinais_sintoma_params)
      redirect_to sinais_sintomas_path, notice: 'Sinais/sintomas atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /sinais_sintomas/1
  def destroy
    @sinais_sintoma.destroy
    redirect_to sinais_sintomas_url, notice: 'Sinais/sintomas excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sinais_sintoma
      @sinais_sintoma = SinaisSintoma.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sinais_sintoma_params
      params.require(:sinais_sintoma).permit(:nome)
    end
end
