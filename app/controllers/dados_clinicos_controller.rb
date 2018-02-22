class DadosClinicosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_dados_clinico, only: [:show, :edit, :update, :destroy]

  # GET /dados_clinicos
  def index
    @q = DadosClinico.all.ransack(params[:q])
    @dados_clinicos = @q.result.page(params[:page])
  end

  # GET /dados_clinicos/1
  def show
  end

  # GET /dados_clinicos/new
  def new
    @dados_clinico = DadosClinico.new
  end

  # GET /dados_clinicos/1/edit
  def edit
  end

  # POST /dados_clinicos
  def create
    @dados_clinico = DadosClinico.new(dados_clinico_params)

    if @dados_clinico.save
      redirect_to @dados_clinico, notice: 'Dados clinico was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dados_clinicos/1
  def update
    if @dados_clinico.update(dados_clinico_params)
      redirect_to @dados_clinico, notice: 'Dados clinico was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dados_clinicos/1
  def destroy
    @dados_clinico.destroy
    redirect_to dados_clinicos_url, notice: 'Dados clinico was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dados_clinico
      @dados_clinico = DadosClinico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dados_clinico_params
      params.require(:dados_clinico).permit(:lesoes_cultaneas, :forma_clinica, :classificacao_operacional, :nervos_afetados, :notificacao_id)
    end
end
