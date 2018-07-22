class DstMovimentacaosController < ApplicationController
  before_action :set_dst_movimentacao, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create, :update]
  before_action :set_lotes, only: [:edit, :create, :update]

  # GET /dst_movimentacaos
  def index
    @q = current_user.dst_movimentacaos.all.ransack(params[:q])
    @dst_movimentacaos = @q.result.page(params[:page])
  end

  # GET /dst_movimentacaos/1
  def show
  end

  # GET /dst_movimentacaos/new
  def new
    @lotes = []
    @dst_movimentacao = DstMovimentacao.new
  end

  # GET /dst_movimentacaos/1/edit
  def edit
  end

  # POST /dst_movimentacaos
  def create
    @dst_movimentacao = DstMovimentacao.new(dst_movimentacao_params)
    if @dst_movimentacao.save
      redirect_to @dst_movimentacao, notice: 'Dst movimentacao was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_movimentacaos/1
  def update
    if @dst_movimentacao.update(dst_movimentacao_params)
      redirect_to @dst_movimentacao, notice: 'Dst movimentacao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dst_movimentacaos/1
  def destroy
    @dst_movimentacao.destroy
    redirect_to dst_movimentacaos_url, notice: 'Dst movimentacao was successfully destroyed.'
  end

  def atender
    begin
      @solicitacao = DstSolicitacao.find_by_token(params[:codigo])
      @solicitacao_produto = DstSolicitacaoProduto.find(params[:controle])
      if @solicitacao_produto.dst_solicitacao != @solicitacao or @solicitacao_produto.status != 'autorizado' or @solicitacao_produto.max_atender <= 0
        @solicitacao_produto = nil
      end
    rescue
      @solicitacao_produto = nil
    end
  end

  def finalizar_atendimento
    #begin
      render js: DstMovimentacao.atender(params)
    #rescue
    #  render js: "swal('Tivemos um problema na execução, tente mais tarde.')"
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_movimentacao
      @dst_movimentacao = DstMovimentacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_movimentacao_params
      params.require(:dst_movimentacao).permit(:dst_produto_id, :tipo, :categoria, :quantidade, :dst_lote_id, :descricao, :dst_local_id, :dst_solicitacao_produto_id)
    end

    def set_combos
      @locals = current_user.dst_locals.map{|a| [a.nome, a.id]}
    end

    def set_lotes
      @lotes = DstLote.all.map{|a| [a.nome, a.id]}
    end
end
