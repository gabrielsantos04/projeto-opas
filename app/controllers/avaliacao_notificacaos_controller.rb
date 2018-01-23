class AvaliacaoNotificacaosController < ApplicationController
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
    @avaliacao_notificacao = AvaliacaoNotificacao.new(notificacao_id: params[:notificacao])
  end

  # GET /avaliacao_notificacaos/1/edit
  def edit
  end

  # POST /avaliacao_notificacaos
  def create
    @avaliacao_notificacao = AvaliacaoNotificacao.new(avaliacao_notificacao_params)

    if @avaliacao_notificacao.save
      redirect_to @avaliacao_notificacao, notice: 'Avaliacao notificacao was successfully created.'
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
      params.require(:avaliacao_notificacao).permit(:classificacao_operacional, :inicio_pqt, :alta_pqt, :profissao, :unidade_saude, :atividades_realizadas_ubs, :grupo_autocuidado, :encaminhamentos,
                                                    :imobilizacoes, :adaptacoes, :observacoes, :notificacao_id,
                                                    avaliacao_neurologicas_attributes:[:id,:queixa_id,:avaliacao_notificacao_id,:direito,:esquerdo,:data,:_destroy],
                                                    classificacao_graus_attributes:[:id,:avaliacao_notificacao_id,:data,:olho_direito,:olho_esquerdo,:mao_direita,:mao_esqueda,:pe_direito,:pe_esquerdo,:maior_grau,:escore_omp,:_destroy])
    end
end
