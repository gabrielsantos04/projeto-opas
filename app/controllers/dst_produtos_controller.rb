#Classe que controla as açoes da DstProdutos
class DstProdutosController < ApplicationController
  before_action :set_dst_produto, only: [:show, :edit, :update, :destroy, :lotes_ajax]

  # GET /dst_produtos
  def index
    @q = DstProduto.all.ransack(params[:q])
    @dst_produtos = @q.result.page(params[:page])
  end

  # GET /dst_produtos/1
  def show
    @dst_locals = @dst_produto.dst_movimentacaos.group(:dst_local).sum(:quantidade)

  end

  # GET /dst_produtos/new
  def new
    @dst_produto = DstProduto.new
    @dst_produto.status = true
  end

  # GET /dst_produtos/1/edit
  def edit
  end

  # POST /dst_produtos
  def create
    @dst_produto = DstProduto.new(dst_produto_params)

    if @dst_produto.save
      redirect_to @dst_produto, notice: 'Dst produto was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_produtos/1
  def update
    if @dst_produto.update(dst_produto_params)
      redirect_to @dst_produto, notice: 'Dst produto was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dst_produtos/1
  def destroy
    @dst_produto.destroy
    redirect_to dst_produtos_url, notice: 'Dst produto was successfully destroyed.'
  end

  #Método utilizado para atualizar os lotes
  def lotes_ajax
    render json: @dst_produto.dst_lotes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_produto
      @dst_produto = DstProduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_produto_params
      params.require(:dst_produto).permit(:nome, :descricao, :unidade_medida, :status)
    end
end
