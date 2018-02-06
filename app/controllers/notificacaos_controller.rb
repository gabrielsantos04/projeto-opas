class NotificacaosController < ApplicationController
  before_action :set_notificacao, only: [:show, :edit, :update, :destroy,:recidiva]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /notificacaos
  def index
    @q = Notificacao.all.ransack(params[:q])
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
  end

  # GET /notificacaos/new
  def new
    @notificacao = Notificacao.new(paciente_id: params[:paciente])
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
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacao
      @notificacao = Notificacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notificacao_params
      params.require(:notificacao).permit(:paciente_id,:numero, :data, :grau_incapacidade, :modo_entrada, :modo_deteccao, :observacoes, :baciloscopia, :data_inicio, :esquema_terapeutico,
                                          esquema_substitutivos_attributes:[:id,:notificacao_id,:miligramas,:medicamento_id,:_destroy],
                                          notificacao_contatoes_attributes:[:bcg_primeira,:bcg_segunda,:bcg_cicatriz,:id,:notificacao_id,:nome,:tipo_contato,:suspeito,:confirmado,:_destroy],
      dados_clinicos_attributes:[:id,:notificacao_id,:lesoes_cultaneas,:forma_clinica,:classificacao_operacional,:nervos_afetados,:_destroy],
                                          episodio_reacionals_attributes:[:id,:notificacao_id,:tipo,:numero_episodios,:conduta_mendicamentosa,:data_inicio,:data_termino,:_destroy],
      recidiva_attributes:[:id,:unidade_saude, :prontuario, :data_diagnostico, :classificacao_operacional, :forma_clinica, :baciloscopia, :baciloscopia_lb, :grau_incapacidade, :inicio_tratamento, :esquema_terapeutico, :tempo_tratamento, :doses, :regularidade, :termino_tratamento, :tratamento_observacoes, :tempo_alta_cura, :data_primeiros_sintomas, :baciloscopia_alta, :baciloscopia_lb_alta, :grau_incapacidade_alta, :classificacao_operacional_alta, :notificacao_id,:_destroy])
    end
end
