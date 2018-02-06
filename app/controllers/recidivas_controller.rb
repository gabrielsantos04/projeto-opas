class RecidivasController < ApplicationController
  before_action :set_recidiva, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only:[:new, :create,:edit]

  # GET /recidivas
  def index
    @q = Recidiva.all.ransack(params[:q])
    @recidivas = @q.result.page(params[:page])
  end

  # GET /recidivas/1
  def show
  end

  # GET /recidivas/new
  def new
    @recidiva = Recidiva.new(notificacao_id: params[:notificacao])
  end

  # GET /recidivas/1/edit
  def edit
  end

  # POST /recidivas
  def create
    @recidiva = Recidiva.new(recidiva_params)

    if @recidiva.save
      redirect_to @recidiva, notice: 'Recidiva was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recidivas/1
  def update
    if @recidiva.update(recidiva_params)
      redirect_to @recidiva, notice: 'Recidiva was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recidivas/1
  def destroy
    @recidiva.destroy
    redirect_to recidivas_url, notice: 'Recidiva was successfully destroyed.'
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
      @dermatologicas = Dermatologica.all.map{|a| [a.nome,a.id]}
      @nervos = NervosRecidiva.nervo.options
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_recidiva
      @recidiva = Recidiva.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recidiva_params
      params.require(:recidiva).permit(:unidade_saude, :prontuario, :data_diagnostico, :classificacao_operacional, :forma_clinica, :baciloscopia, :baciloscopia_lb, :grau_incapacidade, :inicio_tratamento, :esquema_terapeutico, :tempo_tratamento, :doses, :regularidade, :termino_tratamento, :tratamento_observacoes, :tempo_alta_cura, :data_primeiros_sintomas, :baciloscopia_alta, :baciloscopia_lb_alta, :grau_incapacidade_alta, :classificacao_operacional_alta, :notificacao_id)
    end
end
