class ContatoAvaliacaosController < ApplicationController
  before_action :set_contato_avaliacao, only: [:show, :edit, :update, :destroy]

  # GET /contato_avaliacaos
  def index
    @q = ContatoAvaliacao.all.ransack(params[:q])
    @contato_avaliacaos = @q.result.page(params[:page])
  end

  # GET /contato_avaliacaos/1
  def show
  end

  # GET /contato_avaliacaos/new
  def new
    @contato_avaliacao = ContatoAvaliacao.new
  end

  # GET /contato_avaliacaos/1/edit
  def edit
  end

  # POST /contato_avaliacaos
  def create
    @contato_avaliacao = ContatoAvaliacao.new(contato_avaliacao_params)

    if @contato_avaliacao.save
      redirect_to @contato_avaliacao, notice: 'Contato avaliacao was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contato_avaliacaos/1
  def update
    if @contato_avaliacao.update(contato_avaliacao_params)
      redirect_to @contato_avaliacao, notice: 'Contato avaliacao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contato_avaliacaos/1
  def destroy
    @contato_avaliacao.destroy
    redirect_to contato_avaliacaos_url, notice: 'Contato avaliacao was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contato_avaliacao
      @contato_avaliacao = ContatoAvaliacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contato_avaliacao_params
      params.require(:contato_avaliacao).permit(:data, :suspeito, :confirmado, :notificacao_contato_id)
    end
end
