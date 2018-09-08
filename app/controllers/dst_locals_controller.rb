#Classe que controla as açoes da DstLocals
class DstLocalsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_dst_local, only: [:show, :edit, :update, :destroy]

  # GET /dst_locals
  def index
    if current_user.admin_dst?
      @q = DstLocal.all.ransack(params[:q])
    else
      @q = current_user.dst_locals.ransack(params[:q])
    end
    @dst_locals = @q.result.page(params[:page])
  end

  # GET /dst_locals/1
  def show
    @dst_produtos = @dst_local.dst_movimentacaos.group(:dst_produto).sum(:quantidade)
  end

  # GET /dst_locals/new
  def new
    @dst_local = DstLocal.new
  end

  # GET /dst_locals/1/edit
  def edit
  end

  # POST /dst_locals
  def create
    @dst_local = DstLocal.new(dst_local_params)

    if @dst_local.save
      redirect_to @dst_local, notice: 'Dst local was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_locals/1
  def update
    if @dst_local.update(dst_local_params)
      redirect_to @dst_local, notice: 'Dst local was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dst_locals/1
  def destroy
    @dst_local.destroy
    redirect_to dst_locals_url, notice: 'Dst local was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_local
      @dst_local = DstLocal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_local_params
      params.require(:dst_local).permit(
          :nome, :descricao, :cidade_id, :categoria,
          dst_user_locals_attributes:[
              :id, :user_id, :_destroy
          ]
      )
    end
end
