#Classe que controla as açoes da ImunizacaoImunobiologico
class ImunizacaoImunobiologicosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_imunizacao_imunobiologico, only: [:show, :edit, :update, :destroy,:nova_dose,:indeferir]

  # GET /imunizacao_imunobiologicos
  def index
    @q = ImunizacaoImunobiologico.all.ransack(params[:q])
    @imunizacao_imunobiologicos = @q.result.page(params[:page])
  end

  # GET /imunizacao_imunobiologicos/1
  def show
  end


  #Método que cria uma nova dose para o imunobiologico da solicitação
  def nova_dose
    dose = ImunizacaoEsquema.new
    dose.dose = params[:dose]
    dose.esquema = params[:esquema]
    dose.imunizacao_imunobiologico = @imunizacao_imunobiologico
    dose.save
    @imunizacao_imunobiologico.status = :deferido
    @imunizacao_imunobiologico.justificativa_indeferimento = ""
    @imunizacao_imunobiologico.save
    redirect_to @imunizacao_imunobiologico.imunizacao_solicitacao
  end

  #Método que altera o status do imunobiológico para indenferido
  def indeferir
    @imunizacao_imunobiologico.status = :indeferido
    @imunizacao_imunobiologico.justificativa_indeferimento = params[:motivo]
    @imunizacao_imunobiologico.save
    @imunizacao_imunobiologico.imunizacao_esquemas.destroy_all

    redirect_to @imunizacao_imunobiologico.imunizacao_solicitacao
  end

  # GET /imunizacao_imunobiologicos/new
  def new
    @imunizacao_imunobiologico = ImunizacaoImunobiologico.new
  end

  # GET /imunizacao_imunobiologicos/1/edit
  def edit
  end

  # POST /imunizacao_imunobiologicos
  def create
    @imunizacao_imunobiologico = ImunizacaoImunobiologico.new(imunizacao_imunobiologico_params)

    if @imunizacao_imunobiologico.save
      redirect_to @imunizacao_imunobiologico, notice: 'Imunizacao imunobiologico was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_imunobiologicos/1
  def update
    if @imunizacao_imunobiologico.update(imunizacao_imunobiologico_params)
      redirect_to @imunizacao_imunobiologico, notice: 'Imunizacao imunobiologico was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_imunobiologicos/1
  def destroy
    @imunizacao_imunobiologico.destroy
    redirect_to imunizacao_imunobiologicos_url, notice: 'Imunizacao imunobiologico was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_imunobiologico
      @imunizacao_imunobiologico = ImunizacaoImunobiologico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_imunobiologico_params
      params.require(:imunizacao_imunobiologico).permit(:tipo, :nome_vacina, :imunizacao_vacina_id, :imunizacao_solicitacao_id, :status, :justificativa_indeferimento)
    end
end
