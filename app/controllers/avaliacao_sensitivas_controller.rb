class AvaliacaoSensitivasController < ApplicationController
  before_action :set_avaliacao_sensitiva, only: [:show, :edit, :update, :destroy,:inserir_marcacao]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /avaliacao_sensitivas
  def index
    @q = AvaliacaoSensitiva.all.ransack(params[:q])
    @avaliacao_sensitivas = @q.result.page(params[:page])
  end

  # GET /avaliacao_sensitivas/1
  def show
  end

  def inserir_marcacao
    marcacao = Marcacao.create(avaliacao_sensitiva_id: @avaliacao_sensitiva.id,imagem: params[:imagem],posicaox: params[:posicaox],posicaoy: params[:posicaoy],membro: params[:membro] )
    render json: {msg:"ok", marcacao: marcacao.to_json}
  end

  def remover_marcacao
    Marcacao.find(params[:marca]).destroy
    render json: {msg:"ok"}
  end

  # GET /avaliacao_sensitivas/new
  def new
    @avaliacao_sensitiva = AvaliacaoSensitiva.new(avaliacao_notificacao_id: params[:avaliacao])
  end

  # GET /avaliacao_sensitivas/1/edit
  def edit
  end

  # POST /avaliacao_sensitivas
  def create
    @avaliacao_sensitiva = AvaliacaoSensitiva.new(avaliacao_sensitiva_params)

    if @avaliacao_sensitiva.save
      redirect_to @avaliacao_sensitiva.avaliacao_notificacao, notice: 'Avaliação Sensitiva criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /avaliacao_sensitivas/1
  def update
    if @avaliacao_sensitiva.update(avaliacao_sensitiva_params)
      redirect_to @avaliacao_sensitiva.avaliacao_notificacao, notice: 'Avaliação Sensitiva atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /avaliacao_sensitivas/1
  def destroy
    @avaliacao_sensitiva.destroy
    redirect_to @avaliacao_sensitiva.avaliacao_notificacao, notice: 'Avaliação Sensitiva removida com sucesso.'
  end

  private
  def set_combos
    @monofilamentos = Monofilamento.all
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_sensitiva
      @avaliacao_sensitiva = AvaliacaoSensitiva.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def avaliacao_sensitiva_params
      params.require(:avaliacao_sensitiva).permit(:avaliacao_notificacao_id, :data, :dedao_direito, :indicador_d_ponta, :indicador_d, :mindinho_d_ponta, :mindinho_d, :mao_direita, :mao_d_costa, :dedao_esquerdo, :indicador_e_ponta, :indicador_e, :mindinho_e_ponta, :mindinho_e, :mao_esquerda, :mao_e_costa, :pe_direito, :pe_d_1_ponta, :pe_d_3_ponta, :pe_d_5_ponta, :pe_d_1, :pe_d_3, :pe_d_5, :pe_d_e1, :pe_d_e2, :pe_d_calcanhar, :pe_esquerdo, :pe_e_1_ponta, :pe_e_3_ponta, :pe_e_5_ponta, :pe_e_1, :pe_e_3, :pe_e_5, :pe_e_e1, :pe_e_e2, :pe_e_calcanhar,
                                                  marcacaos_attributes:[:id,:avaliacao_sensitiva_id,:imagem,:posicaox,:posicaoy,:membro,:_destroy])
    end
end
