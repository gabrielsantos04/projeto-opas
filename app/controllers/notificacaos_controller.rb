class NotificacaosController < ApplicationController
  before_action :set_notificacao, only: [:show, :edit, :update, :destroy]

  # GET /notificacaos
  def index
    @q = Notificacao.all.ransack(params[:q])
    @notificacaos = @q.result.page(params[:page])
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
      redirect_to @notificacao, notice: 'Notificacao was successfully created.'
    else
      render :new
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
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacao
      @notificacao = Notificacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notificacao_params
      params.require(:notificacao).permit(:numero, :data, :grau_incapacidade, :modo_entrada, :modo_deteccao, :observacoes, :baciloscopia, :data_inicio, :esquema_terapeutico)
    end
end
