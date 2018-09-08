#Classe que controla as açoes da DstSolicitacao
class DstSolicitacaosController < ApplicationController
  before_action :set_dst_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create, :update]

  # GET /dst_solicitacaos
  def index
    if current_user.admin_dst?
      @q = DstSolicitacao.all.ransack(params[:q])
    else
      @q = current_user.dst_solicitacaos.ransack(params[:q])
    end
    @dst_solicitacaos = @q.result.page(params[:page])
  end

  # GET /dst_solicitacaos/1
  def show
  end

  # GET /dst_solicitacaos/new
  def new
    @dst_solicitacao = DstSolicitacao.new
    DstQuestionario.where(ativo: true).map do |q|
      @dst_solicitacao.dst_resposta.build(dst_questionario: q)
    end
  end

  # GET /dst_solicitacaos/1/edit
  def edit
  end

  # POST /dst_solicitacaos
  def create
    @dst_solicitacao = DstSolicitacao.new(dst_solicitacao_params)
    @dst_solicitacao.user = current_user
    @dst_solicitacao.status = :solicitado

    if @dst_solicitacao.save
      redirect_to @dst_solicitacao, notice: 'Dst solicitacao was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_solicitacaos/1
  def update
    if @dst_solicitacao.update(dst_solicitacao_params)
      redirect_to @dst_solicitacao, notice: 'Dst solicitacao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dst_solicitacaos/1
  def destroy
    @dst_solicitacao.destroy
    redirect_to dst_solicitacaos_url, notice: 'Dst solicitacao was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_solicitacao
      @dst_solicitacao = DstSolicitacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_solicitacao_params
      params.require(:dst_solicitacao).permit(
          :dst_local_id, :observacoes, :user_id, :status,
          dst_solicitacao_produtos_attributes:[
              :id, :dst_produto_id, :quantidade, :distribuido, :_destroy
          ],
          dst_resposta_attributes:[
              :id, :dst_questionario_id, :valor
          ]
      )
    end

    #Método utilizado para setar os locais utilizados no formulário
    def set_combos
      @locals = current_user.dst_locals.map{|a| [a.nome, a.id]}
    end
end
