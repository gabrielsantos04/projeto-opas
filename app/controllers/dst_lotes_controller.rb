#Classe que controla as açoes da DstLotes
class DstLotesController < ApplicationController
  before_action :set_dst_lote, only: [:show, :edit, :update, :destroy]

  # GET /dst_lotes
  def index
    @q = DstLote.all.ransack(params[:q])
    @dst_lotes = @q.result.page(params[:page])
  end

  # GET /dst_lotes/1
  def show
  end

  # GET /dst_lotes/new
  def new
    @dst_lote = DstLote.new
  end

  # GET /dst_lotes/1/edit
  def edit
  end

  # POST /dst_lotes
  def create
    @dst_lote = DstLote.new(dst_lote_params)

    if @dst_lote.save
      redirect_to @dst_lote, notice: 'Dst lote was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_lotes/1
  def update
    if @dst_lote.update(dst_lote_params)
      redirect_to @dst_lote, notice: 'Dst lote was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dst_lotes/1
  def destroy
    @dst_lote.destroy
    redirect_to dst_lotes_url, notice: 'Dst lote was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_lote
      @dst_lote = DstLote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_lote_params
      params.require(:dst_lote).permit(:dst_produto_id, :nome, :descricao, :validade)
    end
end
