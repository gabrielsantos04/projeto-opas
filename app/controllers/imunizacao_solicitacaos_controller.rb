#Classe que controla as açoes da ImunizacaoSolicitacao
class ImunizacaoSolicitacaosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_imunizacao_solicitacao, only: [:show, :edit, :update, :destroy]

  # GET /imunizacao_solicitacaos
  def index
    if current_user.administrador? || current_user.admin_imuni?
      @q = ImunizacaoSolicitacao.all.order(created_at: :desc).ransack(params[:q])
    else
      @q = ImunizacaoSolicitacao.where(municipio_atual_id: current_user.cidade.id).order(created_at: :desc).ransack(params[:q])
    end

    @imunizacao_solicitacaos = @q.result.page(params[:page])
  end

  # GET /imunizacao_solicitacaos/1
  def show
  end

  # GET /imunizacao_solicitacaos/new
  def new
    @imunizacao_solicitacao = ImunizacaoSolicitacao.new
    @imunizacao_solicitacao.municipio_atual_id = current_user.cidade.id
  end

  # GET /imunizacao_solicitacaos/1/edit
  def edit
    if @imunizacao_solicitacao.status != :solicitado and (current_user.municipio? || current_user.municipio_imuni?)
      redirect_to @imunizacao_solicitacao, alert: "Esta solicitação não pode mais ser alterada"
    end
  end

  # POST /imunizacao_solicitacaos
  def create
    @imunizacao_solicitacao = ImunizacaoSolicitacao.new(imunizacao_solicitacao_params)

    if @imunizacao_solicitacao.save
      redirect_to @imunizacao_solicitacao, notice: 'Solicitação criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_solicitacaos/1
  def update
    if @imunizacao_solicitacao.update(imunizacao_solicitacao_params)
      redirect_to @imunizacao_solicitacao, notice: 'Solicitação atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_solicitacaos/1
  def destroy
    @imunizacao_solicitacao.destroy
    redirect_to imunizacao_solicitacaos_url, notice: 'Solicitação excluída com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_solicitacao
      @imunizacao_solicitacao = ImunizacaoSolicitacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_solicitacao_params
      params.require(:imunizacao_solicitacao).permit(
          :nome_paciente, :idade,:telefone_paciente,:data_nascimento, :sexo, :nome_mae, :endereco,
          :bairro, :municipio_id, :motivo_solicitacao, :nome_requisitante,
          :tipo_requisitante, :crm_coren, :telefone_requisitante, :solicitante_tipo, :solicitante_crm_corem, :solicitante_telefone, :solicitante_instituicao, :solicitante_municipio,
          :instituicao_requisitante, :municipio_requisitante_id, {anexos:[] },
          :solicitante, :observacoes,:deferimento, :data_atendimento, :municipio_atual_id,
          :status,
          imunobiologicos_attributes:[
              :id, :_destroy, :tipo, :nome_vacina, :imunizacao_vacina_id,:imunizacao_indication_id,
              :imunizacao_solicitacao_id, :status, :justificativa_indeferimento,
              imunizacao_esquemas_attributes:[
                  :id, :_destroy, :imunizacao_imunobiologicos_id, :dose, :esquema,
                  :status, :justificativa,
                  imunizacao_encerramentos_attributes: [
                      :id, :_destroy, :imunizacao_esquema_id, :data_administracao,
                      :lote, :validade, :laboratorio, :unidade_administracao,
                      :via_administracao, :profissional, :observacoes
                  ]
              ]
          ],
          outros_imunobiologicos_attributes:[
              :id, :_destroy, :tipo, :nome_vacina,
              :imunizacao_solicitacao_id, :status, :justificativa_indeferimento
          ],
          imunizacao_files_attributes:[:id,:descricao,:anexo,:imunizacao_solicitacao_id,:_destroy]
      )
    end
end
