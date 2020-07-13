#Classe que controla as açoes da ImunizacaoVacina
class ImunizacaoVacinasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_imunizacao_vacina, only: [:show, :edit, :update, :destroy,:retornarIndicacoes]

  # GET /imunizacao_vacinas
  def index
    @q = ImunizacaoVacina.all.order(nome: :asc).ransack(params[:q])
    @imunizacao_vacinas = @q.result.page(params[:page])
  end

  # GET /imunizacao_vacinas/1
  def show
  end

  # GET /imunizacao_vacinas/new
  def new
    @imunizacao_vacina = ImunizacaoVacina.new
  end

  # GET /imunizacao_vacinas/1/edit
  def edit
  end


  def relatorio
    @q = ImunizacaoSolicitacao.includes(:imunobiologicos,:imunizacao_esquemas,:imunizacao_encerramentos).all.order(created_at: :desc).ransack(params[:q])


    @imunizacao_solicitacaos = @q.result.page(params[:page])
  end

  #Método que retorna as indicacoes da vacina
  def retornarIndicacoes
    @combo = params[:combo]
    @indicacoes = @imunizacao_vacina.imunizacao_indications.order(:descricao)
  end

  # POST /imunizacao_vacinas
  def create
    @imunizacao_vacina = ImunizacaoVacina.new(imunizacao_vacina_params)

    if @imunizacao_vacina.save
      redirect_to @imunizacao_vacina, notice: 'Imunobiológico criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_vacinas/1
  def update
    if @imunizacao_vacina.update(imunizacao_vacina_params)
      redirect_to @imunizacao_vacina, notice: 'Imunobiológico atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_vacinas/1
  def destroy
    @imunizacao_vacina.destroy
    redirect_to imunizacao_vacinas_url, notice: 'Imunobiológico excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_vacina
      @imunizacao_vacina = ImunizacaoVacina.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_vacina_params
      params.require(:imunizacao_vacina).permit(:nome, :descricao, imunizacao_indications_attributes:[:id,:descricao,:imunizacao_vacina_id, :_destroy])
    end
end
