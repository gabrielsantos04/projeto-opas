class ImunizacaoIndicationsController < ApplicationController
  before_action :set_imunizacao_indication, only: [:show, :edit, :update, :destroy,:retornar_vacinas]
  before_action :set_combos, only: [:new, :edit, :update, :create]

  # GET /imunizacao_indications
  def index
    @q = ImunizacaoIndication.all.ransack(params[:q])
    @imunizacao_indications = @q.result.page(params[:page])
  end

  # GET /imunizacao_indications/1
  def show
  end

  # GET /imunizacao_indications/new
  def new
    @imunizacao_indication = ImunizacaoIndication.new
  end

  # GET /imunizacao_indications/1/edit
  def edit
  end

  #Método que retorna as indicacoes da vacina
  def retornar_vacinas
    @combo = params[:combo]
    @vacinas = @imunizacao_indication.imunizacao_vacinas.order(:nome)
  end

  # POST /imunizacao_indications
  def create
    @imunizacao_indication = ImunizacaoIndication.new(imunizacao_indication_params)

    if @imunizacao_indication.save
      redirect_to @imunizacao_indication, notice: 'Indicação cadastrada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_indications/1
  def update
    if @imunizacao_indication.update(imunizacao_indication_params)
      redirect_to @imunizacao_indication, notice: 'Indicação atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_indications/1
  def destroy
    @imunizacao_indication.destroy
    redirect_to imunizacao_indications_url, notice: 'Indicação excluída com sucesso.'
  end

  private

  def set_combos
    @vacinas = ImunizacaoVacina.to_select
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_indication
      @imunizacao_indication = ImunizacaoIndication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_indication_params
      params.require(:imunizacao_indication).permit(:id,:descricao, imunizacao_vacina_indications_attributes:[:id,:imunizacao_vacina_id, :imunizacao_indication_id, :_destroy])
    end
end
