class NotificacaosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_notificacao, only: [:show, :edit, :update, :destroy,:recidiva]
  before_action :set_combos, only: [:new, :edit, :create,:update]

  # GET /notificacaos
  def index
    if current_user.administrador?
      @q = Notificacao.all.ransack(params[:q])
    else
      @q = Notificacao.includes(:paciente).where(pacientes: {cidade: current_user.cidade}).ransack(params[:q])
    end

    @notificacaos = @q.result.page(params[:page])
  end

  def home
    @pacientes = Paciente.all
    @notificacoes = Notificacao.all
    @contatos = NotificacaoContato.all
    @incidencia = Cidade.order(pacientes_count: :desc).first
  end

  # GET /notificacaos/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Notificacao-#{@notificacao.numero}"
      end
    end
  end

  def avaliacao_pendente
    if current_user.administrador?
      notificacoes = Notificacao.includes(:paciente,:avaliacao_notificacaos).all
    else
      notificacoes = Notificacao.includes(:paciente,:avaliacao_notificacaos).where(pacientes: {cidade: current_user.cidade})
    end
    @pendentes = []
    notificacoes.each do |n|
      meses = (DateTime.now.year * 12 + DateTime.now.month) - (n.data_inicio.year * 12 + n.data_inicio.month)
      if (meses >=3 and meses < 6) and n.avaliacao_notificacaos.size < 1
        @pendentes << n
      end
      if (meses >=6 and meses < 9) and n.avaliacao_notificacaos.size < 2
        @pendentes << n
      end
      if (meses >=9 and meses < 12) and n.avaliacao_notificacaos.size < 3
        @pendentes << n
      end
      if meses >= 12  and n.avaliacao_notificacaos.size < 4
        @pendentes << n
      end

    end
  end

  # GET /notificacaos/new
  def new
    @notificacao = Notificacao.new(paciente_id: params[:paciente])
    if params[:recidiva].present?
      @notificacao.recidiva_id = params[:recidiva]
      @notificacao.modo_entrada = :recidiva
    end
    if params[:avaliacao].present?
      @notificacao.avaliacao_notificacao_id = params[:avaliacao]
    end
  end

  # GET /notificacaos/1/edit
  def edit
  end

  # POST /notificacaos
  def create
    @notificacao = Notificacao.new(notificacao_params)

    if @notificacao.save
      redirect_to @notificacao.paciente, notice: 'Notificação criada com sucesso!'
    else
      render :new
    end
  end

  def recidiva
    recidiva = @notificacao.recidivas.first
    if recidiva
      redirect_to recidiva_path(recidiva)
    else
      redirect_to new_recidiva_path(notificacao: @notificacao.id)
    end

  end

  # PATCH/PUT /notificacaos/1
  def update
    if @notificacao.update(notificacao_params)
      redirect_to @notificacao, notice: 'Notificacao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notificacaos/1
  def destroy
    @notificacao.destroy
    redirect_to notificacaos_url, notice: 'Notificacao was successfully destroyed.'
  end

  private

  def set_combos
    @graus_incapacidade = Notificacao.grau_incapacidade.options
    @modos_entrada = Notificacao.modo_entrada.options
    @modos_deteccao = Notificacao.modo_deteccao.options
    @baciloscopias = Notificacao.baciloscopia.options
    @esquemas = Notificacao.esquema_terapeutico.options
    @medicamentos = Medicamento.all.sort_by{|a| a.nome}.map{|a| [a.nome,a.id]}
    @tipos_contato = NotificacaoContato.tipo_contato.options
    @formas_clinicas = DadosClinico.forma_clinica.options
    @classificacoes_operacional = DadosClinico.classificacao_operacional.options
    @episodios_reacionais = EpisodioReacional.tipo.options
    @classificacoes_operacionais = AvaliacaoNotificacao.classificacao_operacional.options
    @queixas = Queixa.all.group_by(&:categoria)#.map{|a| [a.nome,a.id]}
    @categorias = Queixa.categoria.options
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacao
      @notificacao = Notificacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notificacao_params
      params.require(:notificacao).permit(:avaliacao_notificacao_id,:recidiva_id,:paciente_id,:numero, :data, :grau_incapacidade, :modo_entrada, :modo_deteccao, :observacoes, :baciloscopia, :data_inicio, :esquema_terapeutico,
                                          esquema_substitutivos_attributes:[:id,:notificacao_id,:miligramas,:medicamento_id,:_destroy],
                                          notificacao_contatoes_attributes:[:bcg_primeira,:bcg_segunda,:bcg_cicatriz,:id,:notificacao_id,:nome,:tipo_contato,:suspeito,:confirmado,:_destroy],
      dados_clinicos_attributes:[:id,:notificacao_id,:lesoes_cultaneas,:forma_clinica,:classificacao_operacional,:nervos_afetados,:_destroy],
                                          episodio_reacionals_attributes:[:id,:notificacao_id,:tipo,:numero_episodios,:conduta_mendicamentosa,:data_inicio,:data_termino,:_destroy],
      recidiva_attributes:[:id,:unidade_saude, :prontuario, :data_diagnostico, :classificacao_operacional, :forma_clinica, :baciloscopia, :baciloscopia_lb, :grau_incapacidade,
                           :inicio_tratamento, :esquema_terapeutico, :tempo_tratamento, :doses,
                           :regularidade, :termino_tratamento, :tratamento_observacoes, :tempo_alta_cura,
                           :data_primeiros_sintomas, :baciloscopia_alta, :baciloscopia_lb_alta,
                           :grau_incapacidade_alta, :classificacao_operacional_alta, :notificacao_id,:_destroy],
      avaliacao_notificacaos_attributes:[:id,:classificacao_operacional, :inicio_pqt, :alta_pqt, :profissao, :unidade_saude, :atividades_realizadas_ubs, :grupo_autocuidado, :encaminhamentos,
                                         :imobilizacoes, :adaptacoes, :observacoes, :notificacao_id,:_destroy,
                                         avaliacao_neurologicas_attributes:[:id,:avaliacao_notificacao_id,:data,:olhos_sem_forca_d,:olhos_sem_forca_e,:olhos_com_forca_d,:olhos_com_forca_e,:triquiase_d,:triquiase_e,:ectropio_d,:ectropio_e,:catarata_d,:catarata_e,:sensibilidade_cornea_d,:sensibilidade_cornea_e,:opacidade_corneana_d,:opacidade_corneana_e,:acuidade_visual_d,:acuidade_visual_e,:ressecamento_d,:ressecamento_e,:feridas_d,:feridas_e,:perfuracao_septo_d,:perfuracao_septo_e,:nervo_radial_d,:nervo_radial_e,:nervo_ulnar_d,:nervo_ulnar_e,:nervo_mediano_d,:nervo_mediano_e,:abducao_5_dedo_d,:abducao_5_dedo_e,:abducao_polegar_d,:abducao_polegar_e,:extensores_punho_d,:extensores_punho_e,:nervo_fibular_d,:nervo_fibular_e,:nervo_tibial_d,:nervo_tibial_e,:extensao_halux_d,:extensao_halux_e,:dorsiflexao_pe_d,:dorsiflexao_pe_e,:_destroy],
                                         classificacao_graus_attributes:[:id,:avaliacao_notificacao_id,:data,:olho_direito,:olho_esquerdo,:mao_direita,:mao_esqueda,:pe_direito,:pe_esquerdo,:maior_grau,:escore_omp,:_destroy]])
    end
end
