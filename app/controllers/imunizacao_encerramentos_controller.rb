class ImunizacaoEncerramentosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_imunizacao_encerramento, only: [:show, :edit, :update, :destroy]

  # GET /imunizacao_encerramentos
  def index
    @q = ImunizacaoEncerramento.all.ransack(params[:q])
    @imunizacao_encerramentos = @q.result.page(params[:page])
  end

  # GET /imunizacao_encerramentos/1
  def show
  end

  # GET /imunizacao_encerramentos/new
  def new
    @imunizacao_encerramento = ImunizacaoEncerramento.new
  end

  # GET /imunizacao_encerramentos/1/edit
  def edit
  end

  # POST /imunizacao_encerramentos
  def create
    @imunizacao_encerramento = ImunizacaoEncerramento.new(imunizacao_encerramento_params)

    if @imunizacao_encerramento.save
      redirect_to @imunizacao_encerramento, notice: 'Imunizacao encerramento was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_encerramentos/1
  def update
    if @imunizacao_encerramento.update(imunizacao_encerramento_params)
      redirect_to @imunizacao_encerramento, notice: 'Imunizacao encerramento was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_encerramentos/1
  def destroy
    @imunizacao_encerramento.destroy
    redirect_to imunizacao_encerramentos_url, notice: 'Imunizacao encerramento was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_encerramento
      @imunizacao_encerramento = ImunizacaoEncerramento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_encerramento_params
      params.require(:imunizacao_encerramento).permit(:imunizacao_esquema_id, :data_administracao, :lote, :validade, :laboratorio, :unidade_administracao, :via_administracao, :profissional, :observacoes)
    end
end
