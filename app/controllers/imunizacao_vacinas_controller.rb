class ImunizacaoVacinasController < ApplicationController
  before_action :set_imunizacao_vacina, only: [:show, :edit, :update, :destroy]

  # GET /imunizacao_vacinas
  def index
    @q = ImunizacaoVacina.all.ransack(params[:q])
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

  # POST /imunizacao_vacinas
  def create
    @imunizacao_vacina = ImunizacaoVacina.new(imunizacao_vacina_params)

    if @imunizacao_vacina.save
      redirect_to @imunizacao_vacina, notice: 'Imunizacao vacina was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /imunizacao_vacinas/1
  def update
    if @imunizacao_vacina.update(imunizacao_vacina_params)
      redirect_to @imunizacao_vacina, notice: 'Imunizacao vacina was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /imunizacao_vacinas/1
  def destroy
    @imunizacao_vacina.destroy
    redirect_to imunizacao_vacinas_url, notice: 'Imunizacao vacina was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imunizacao_vacina
      @imunizacao_vacina = ImunizacaoVacina.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imunizacao_vacina_params
      params.require(:imunizacao_vacina).permit(:nome, :descricao)
    end
end
