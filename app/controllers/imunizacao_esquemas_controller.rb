class ImunizacaoEsquemasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_imunizacao_esquema, only: [:show, :edit, :update, :destroy,:novo_encerramento,:nao_aplicado]

  # GET /imunizacao_esquemas
  def index
    @q = ImunizacaoEsquema.all.ransack(params[:q])
    @imunizacao_esquemas = @q.result.page(params[:page])
  end

  # GET /imunizacao_esquemas/1
  def show
  end

  def novo_encerramento
    encerramento = ImunizacaoEncerramento.new
    encerramento.data_administracao = params[:data_administracao]
    encerramento.lote = params[:lote]
    encerramento.validade = params[:validade]
    encerramento.laboratorio  = params[:laboratorio]
    encerramento.unidade_administracao = params[:unidade_administracao]
    encerramento.via_administracao = params[:via_administracao]
    encerramento.profissional = params[:profissional]
    encerramento.observacoes = params[:observacoes]
    encerramento.imunizacao_esquema = @imunizacao_esquema
    encerramento.save
    @imunizacao_esquema.status = :concluido
    @imunizacao_esquema.save

    redirect_to @imunizacao_esquema.imunizacao_solicitacao
  end

  def nao_aplicado
    @imunizacao_esquema.justificativa = params[:motivo]
    @imunizacao_esquema.status = :nao_aplicado
    @imunizacao_esquema.save

    redirect_to @imunizacao_esquema.imunizacao_solicitacao
  end


  # GET /imunizacao_esquemas/new
  def new
    @imunizacao_esquema = ImunizacaoEsquema.new
  end

  # GET /imunizacao_esquemas/1/edit
  def edit
  end

  # POST /imunizacao_esquemas
  def create
    @imunizacao_esquema = ImunizacaoEsquema.new(imunizacao_esquema_params)

    if @imunizacao_esquema.save
      redirect_to @imunizacao_esquema, notice: 'Imunizacao esquema was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_esquemas/1
  def update
    if @imunizacao_esquema.update(imunizacao_esquema_params)
      redirect_to @imunizacao_esquema, notice: 'Imunizacao esquema was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_esquemas/1
  def destroy
    @imunizacao_esquema.destroy
    redirect_to imunizacao_esquemas_url, notice: 'Imunizacao esquema was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_esquema
      @imunizacao_esquema = ImunizacaoEsquema.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_esquema_params
      params.require(:imunizacao_esquema).permit(:imunizacao_imunobiologicos_id, :dose, :esquema, :status, :justificativa)
    end
end
