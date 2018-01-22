class AvaliacaoSensitivasController < ApplicationController
  before_action :set_avaliacao_sensitiva, only: [:show, :edit, :update, :destroy]

  # GET /avaliacao_sensitivas
  def index
    @q = AvaliacaoSensitiva.all.ransack(params[:q])
    @avaliacao_sensitivas = @q.result.page(params[:page])
  end

  # GET /avaliacao_sensitivas/1
  def show
  end

  # GET /avaliacao_sensitivas/new
  def new
    @avaliacao_sensitiva = AvaliacaoSensitiva.new
  end

  # GET /avaliacao_sensitivas/1/edit
  def edit
  end

  # POST /avaliacao_sensitivas
  def create
    @avaliacao_sensitiva = AvaliacaoSensitiva.new(avaliacao_sensitiva_params)

    if @avaliacao_sensitiva.save
      redirect_to @avaliacao_sensitiva, notice: 'Avaliacao sensitiva was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /avaliacao_sensitivas/1
  def update
    if @avaliacao_sensitiva.update(avaliacao_sensitiva_params)
      redirect_to @avaliacao_sensitiva, notice: 'Avaliacao sensitiva was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /avaliacao_sensitivas/1
  def destroy
    @avaliacao_sensitiva.destroy
    redirect_to avaliacao_sensitivas_url, notice: 'Avaliacao sensitiva was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_sensitiva
      @avaliacao_sensitiva = AvaliacaoSensitiva.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def avaliacao_sensitiva_params
      params.require(:avaliacao_sensitiva).permit(:avaliacao_notificacao_id, :data, :dedao_direito, :indicador_d_ponta, :indicador_d, :mindinho_d_ponta, :mindinho_d, :mao_direita, :mao_d_costa, :dedao_esquerdo, :indicador_e_ponta, :indicador_e, :mindinho_e_ponta, :mindinho_e, :mao_esquerda, :mao_e_costa, :pe_direito, :pe_d_1_ponta, :pe_d_3_ponta, :pe_d_5_ponta, :pe_d_1, :pe_d_3, :pe_d_5, :pe_d_e1, :pe_d_e1, :pe_d_calcanhar, :pe_esquerdo, :pe_e_1_ponta, :pe_e_3_ponta, :pe_e_5_ponta, :pe_e_1, :pe_e_3, :pe_e_5, :pe_e_e1, :pe_e_e2, :pe_e_calcanhar)
    end
end
