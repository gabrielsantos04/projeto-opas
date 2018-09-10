#Classe que controla as açoes da EscalaSalsa
class EscalaSalsasController < ApplicationController
  before_action :set_escala_salsa, only: [:show, :edit, :update, :destroy]

  # GET /escala_salsas
  def index
    @q = EscalaSalsa.all.ransack(params[:q])
    @escala_salsas = @q.result.page(params[:page])
  end

  # GET /escala_salsas/1
  def show
  end

  # GET /escala_salsas/new
  def new
    @escala_salsa = EscalaSalsa.new
    paciente = Paciente.find(params[:paciente])
    @escala_salsa.paciente = paciente
    @notificacoes = paciente.notificacaos.map{|a| [a.numero,a.id]}
  end

  # GET /escala_salsas/1/edit
  def edit
    @notificacoes = @escala_salsa.paciente.notificacaos.map{|a| [a.numero,a.id]}
  end

  # POST /escala_salsas
  def create
    @escala_salsa = EscalaSalsa.new(escala_salsa_params)

    if @escala_salsa.save
      redirect_to @escala_salsa, notice: 'Escala salsa was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /escala_salsas/1
  def update
    if @escala_salsa.update(escala_salsa_params)
      redirect_to @escala_salsa, notice: 'Escala salsa was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /escala_salsas/1
  def destroy
    @escala_salsa.destroy
    redirect_to escala_salsas_url, notice: 'Escala salsa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escala_salsa
      @escala_salsa = EscalaSalsa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def escala_salsa_params
      params.require(:escala_salsa).permit(:paciente_id, :notificacao_id, :data_entrevista, :entrevistador, :questao_1, :questao_2, :questao_3, :questao_4, :questao_5, :questao_6, :questao_7, :questao_8, :questao_9, :questao_10, :questao_11, :questao_12, :questao_13, :questao_14, :questao_15, :questao_16, :questao_17, :questao_18, :questao_19, :questao_20, :escore_facil, :escore_pouco_dificil, :escore_muito_dificil, :escore_nao_preciso, :escore_fisicamente, :escore_evito, :escore_salsa, :escore_risco, :condicoes_medicas, :adaptacoes, :responsavel)
    end
end
