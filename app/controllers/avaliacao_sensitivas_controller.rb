class AvaliacaoSensitivasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
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
    marcacao = Marcacao.find(params[:marca])
    marcacao.destroy
    #redirect_to edit_avaliacao_sensitiva_path(marcacao.avaliacao_sensitiva)
    render json: {msg:"ok"}
  end

  # GET /avaliacao_sensitivas/new
  def new
    @avaliacao_sensitiva = AvaliacaoSensitiva.new(avaliacao_notificacao_id: params[:avaliacao])
    @avaliacao_sensitiva.save
    SensitivaImage.create!(avaliacao_sensitiva: @avaliacao_sensitiva,opcao: 'mao_direita')
    SensitivaImage.create!(avaliacao_sensitiva: @avaliacao_sensitiva,opcao: 'mao_esquerda')
    SensitivaImage.create!(avaliacao_sensitiva: @avaliacao_sensitiva,opcao: 'pe_direito')
    SensitivaImage.create!(avaliacao_sensitiva: @avaliacao_sensitiva,opcao: 'pe_esquerdo')
    redirect_to edit_avaliacao_sensitiva_path(@avaliacao_sensitiva)
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
      #salva as imagens da avaliacao sensitiva
      unless params[:base64_mao_direita].empty?
        data =  params[:base64_mao_direita]
        img = SensitivaImage.where("avaliacao_sensitiva_id = ? and opcao = ?",@avaliacao_sensitiva.id,'mao_direita').first_or_create(avaliacao_sensitiva: @avaliacao_sensitiva, opcao: 'mao_direita')
        img.imagem = params[:base64_mao_direita]
        img.imagem.recreate_versions!
        img.save
      end
      unless params[:base64_mao_esquerda].empty?
        data =  params[:base64_mao_esquerda]
        img = SensitivaImage.where("avaliacao_sensitiva_id = ? and opcao = ?",@avaliacao_sensitiva.id,'mao_esquerda').first_or_create(avaliacao_sensitiva: @avaliacao_sensitiva, opcao: 'mao_esquerda')
        img.imagem = params[:base64_mao_esquerda]
        img.imagem.recreate_versions!
        img.save
      end
      unless params[:base64_pe_direito].empty?
        data =  params[:base64_pe_direito]
        img = SensitivaImage.where("avaliacao_sensitiva_id = ? and opcao = ?",@avaliacao_sensitiva.id,'pe_direito').first_or_create(avaliacao_sensitiva: @avaliacao_sensitiva, opcao: 'pe_direito')
        img.imagem = params[:base64_pe_direito]
        img.imagem.recreate_versions!
        img.save
      end
      unless params[:base64_pe_esquerdo].empty?
        data =  params[:base64_pe_esquerdo]
        img = SensitivaImage.where("avaliacao_sensitiva_id = ? and opcao = ?",@avaliacao_sensitiva.id,'pe_esquerdo').first_or_create(avaliacao_sensitiva: @avaliacao_sensitiva, opcao: 'pe_esquerdo')
        img.imagem = params[:base64_pe_esquerdo]
        img.imagem.recreate_versions!
        img.save
      end
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
