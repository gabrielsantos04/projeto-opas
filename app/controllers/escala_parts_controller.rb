class EscalaPartsController < ApplicationController
  before_action :set_escala_part, only: [:show, :edit, :update, :destroy]

  # GET /escala_parts
  def index
    @q = EscalaPart.all.ransack(params[:q])
    @escala_parts = @q.result.page(params[:page])
  end

  # GET /escala_parts/1
  def show
  end

  # GET /escala_parts/new
  def new
    @escala_part = EscalaPart.new
    paciente = Paciente.find(params[:paciente])
    @escala_part.paciente = paciente
    @notificacoes = paciente.notificacaos.map{|a| [a.numero,a.id]}
  end

  # GET /escala_parts/1/edit
  def edit
    @notificacoes = @escala_part.paciente.notificacaos.map{|a| [a.numero,a.id]}
  end

  # POST /escala_parts
  def create
    @escala_part = EscalaPart.new(escala_part_params)

    if @escala_part.save
      redirect_to @escala_part, notice: 'Escala part was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /escala_parts/1
  def update
    if @escala_part.update(escala_part_params)
      redirect_to @escala_part, notice: 'Escala part was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /escala_parts/1
  def destroy
    @escala_part.destroy
    redirect_to escala_parts_url, notice: 'Escala part was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escala_part
      @escala_part = EscalaPart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def escala_part_params
      params.require(:escala_part).permit(:questao_1, :questao_1_valor, :questao_2, :questao_2_valor, :questao_3, :questao_3_valor, :questao_4, :questao_4_valor, :questao_5, :questao_5_valor, :questao_6, :questao_6_valor, :questao_7, :questao_7_valor, :questao_8, :questao_8_valor, :questao_9, :questao_9_valor, :questao_10, :questao_10_valor, :questao_11, :questao_11_valor, :questao_12, :questao_12_valor, :questao_13, :questao_13_valor, :questao_14, :questao_14_valor, :questao_15, :questao_15_valor, :questao_16, :questao_16_valor, :questao_17, :questao_17_valor, :questao_18, :questao_18_valor, :data_entrevista, :entrevistador, :total, :grau_restricao, :comentario, :paciente_id, :notificacao_id)
    end
end
