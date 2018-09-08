#Classe que controla as açoes da avaliação notificação
class AvaliacaoNotificacaosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_avaliacao_notificacao, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /avaliacao_notificacaos
  def index
    @q = AvaliacaoNotificacao.all.ransack(params[:q])
    @avaliacao_notificacaos = @q.result.page(params[:page])
  end

  # GET /avaliacao_notificacaos/1
  def show
  end

  # GET /avaliacao_notificacaos/new
  def new
    if params[:notificacao].present?
      @avaliacao_notificacao = AvaliacaoNotificacao.new(notificacao_id: params[:notificacao])
      notificacao = Notificacao.find(params[:notificacao])
      @avaliacao_notificacao.paciente_id = notificacao.paciente_id
    else
      @avaliacao_notificacao = AvaliacaoNotificacao.new(paciente_id: params[:paciente])
      @avaliacao_notificacao.inicial = true
    end

  end

  # GET /avaliacao_notificacaos/1/edit
  def edit
  end

  # POST /avaliacao_notificacaos
  def create
    @avaliacao_notificacao = AvaliacaoNotificacao.new(avaliacao_notificacao_params)

    if @avaliacao_notificacao.save
      redirect_to @avaliacao_notificacao, notice: 'Avaliação criada com sucesso'
    else
      render :new
    end
  end

  # PATCH/PUT /avaliacao_notificacaos/1
  def update
    if @avaliacao_notificacao.update(avaliacao_notificacao_params)
      redirect_to @avaliacao_notificacao, notice: 'Avaliacao notificacao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /avaliacao_notificacaos/1
  def destroy
    @avaliacao_notificacao.destroy
    redirect_to avaliacao_notificacaos_url, notice: 'Avaliacao notificacao was successfully destroyed.'
  end

  private

  def set_combos
    @classificacoes_operacionais = AvaliacaoNotificacao.classificacao_operacional.options
    @queixas = Queixa.all.group_by(&:categoria)#.map{|a| [a.nome,a.id]}
    @categorias = Queixa.categoria.options
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_notificacao
      @avaliacao_notificacao = AvaliacaoNotificacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def avaliacao_notificacao_params
      params.require(:avaliacao_notificacao).permit(:inicial,:paciente_id,:classificacao_operacional, :inicio_pqt, :alta_pqt, :profissao, :unidade_saude, :atividades_realizadas_ubs, :grupo_autocuidado, :encaminhamentos,
                                                    :imobilizacoes, :adaptacoes, :observacoes, :notificacao_id,
                                                    avaliacao_neurologicas_attributes:[:id,:avaliacao_notificacao_id,:data,:olhos_sem_forca_d,:olhos_sem_forca_e,:olhos_com_forca_d,:olhos_com_forca_e,:triquiase_d,:triquiase_e,:ectropio_d,:ectropio_e,:catarata_d,:catarata_e,:sensibilidade_cornea_d,:sensibilidade_cornea_e,:opacidade_corneana_d,:opacidade_corneana_e,:acuidade_visual_d,:acuidade_visual_e,:ressecamento_d,:ressecamento_e,:feridas_d,:feridas_e,:perfuracao_septo_d,:perfuracao_septo_e,:nervo_radial_d,:nervo_radial_e,:nervo_ulnar_d,:nervo_ulnar_e,:nervo_mediano_d,:nervo_mediano_e,:abducao_5_dedo_d,:abducao_5_dedo_e,:abducao_polegar_d,:abducao_polegar_e,:extensores_punho_d,:extensores_punho_e,:nervo_fibular_d,:nervo_fibular_e,:nervo_tibial_d,:nervo_tibial_e,:extensao_halux_d,:extensao_halux_e,:dorsiflexao_pe_d,:dorsiflexao_pe_e,:_destroy],
                                                    classificacao_graus_attributes:[:id,:avaliacao_notificacao_id,:data,:olho_direito,:olho_esquerdo,:mao_direita,:mao_esqueda,:pe_direito,:pe_esquerdo,:maior_grau,:escore_omp,:_destroy])
    end
end
