#Classe que controla as açoes da DstSolicitacaoProduto
class DstSolicitacaoProdutosController < ApplicationController
  before_action :set_dst_solicitacao_produto, only: [:show, :edit, :update, :destroy]

  # GET /dst_solicitacao_produtos
  def index
    @q = DstSolicitacaoProduto.all.ransack(params[:q])
    @dst_solicitacao_produtos = @q.result.page(params[:page])
  end

  # GET /dst_solicitacao_produtos/1
  def show
  end

  # GET /dst_solicitacao_produtos/new
  def new
    @dst_solicitacao_produto = DstSolicitacaoProduto.new
  end

  # GET /dst_solicitacao_produtos/1/edit
  def edit
  end

  # POST /dst_solicitacao_produtos
  def create
    @dst_solicitacao_produto = DstSolicitacaoProduto.new(dst_solicitacao_produto_params)

    if @dst_solicitacao_produto.save
      redirect_to @dst_solicitacao_produto, notice: 'Produto criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_solicitacao_produtos/1
  def update
    if @dst_solicitacao_produto.update(dst_solicitacao_produto_params)
      redirect_to @dst_solicitacao_produto, notice: 'Produto atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /dst_solicitacao_produtos/1
  def destroy
    @dst_solicitacao_produto.destroy
    redirect_to dst_solicitacao_produtos_url, notice: 'Produto excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_solicitacao_produto
      @dst_solicitacao_produto = DstSolicitacaoProduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_solicitacao_produto_params
      params.require(:dst_solicitacao_produto).permit(:dst_lote_id, :quantidade_atendido,:dst_produto_id, :quantidade_aprovada, :status, :dst_solicitacao_id, :user_id, :observacoes)
    end
end
