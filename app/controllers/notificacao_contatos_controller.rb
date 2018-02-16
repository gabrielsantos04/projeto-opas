class NotificacaoContatosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_notificacao_contato, only: [:show, :edit, :update, :destroy]

  # GET /notificacao_contatos
  def index
    @q = NotificacaoContato.all.ransack(params[:q])
    @notificacao_contatos = @q.result.page(params[:page])
  end

  # GET /notificacao_contatos/1
  def show
  end

  # GET /notificacao_contatos/new
  def new
    @notificacao_contato = NotificacaoContato.new
  end

  # GET /notificacao_contatos/1/edit
  def edit
  end

  # POST /notificacao_contatos
  def create
    @notificacao_contato = NotificacaoContato.new(notificacao_contato_params)

    if @notificacao_contato.save
      redirect_to @notificacao_contato, notice: 'Notificacao contato was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notificacao_contatos/1
  def update
    if @notificacao_contato.update(notificacao_contato_params)
      redirect_to @notificacao_contato, notice: 'Notificacao contato was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notificacao_contatos/1
  def destroy
    @notificacao_contato.destroy
    redirect_to notificacao_contatos_url, notice: 'Notificacao contato was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacao_contato
      @notificacao_contato = NotificacaoContato.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notificacao_contato_params
      params.require(:notificacao_contato).permit(:nome, :tipo_contato, :suspeito, :confirmado, :notificacao_id)
    end
end
