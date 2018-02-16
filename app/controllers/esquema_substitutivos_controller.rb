class EsquemaSubstitutivosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_esquema_substitutivo, only: [:show, :edit, :update, :destroy]

  # GET /esquema_substitutivos
  def index
    @q = EsquemaSubstitutivo.all.ransack(params[:q])
    @esquema_substitutivos = @q.result.page(params[:page])
  end

  # GET /esquema_substitutivos/1
  def show
  end

  # GET /esquema_substitutivos/new
  def new
    @esquema_substitutivo = EsquemaSubstitutivo.new
  end

  # GET /esquema_substitutivos/1/edit
  def edit
  end

  # POST /esquema_substitutivos
  def create
    @esquema_substitutivo = EsquemaSubstitutivo.new(esquema_substitutivo_params)

    if @esquema_substitutivo.save
      redirect_to @esquema_substitutivo, notice: 'Esquema substitutivo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /esquema_substitutivos/1
  def update
    if @esquema_substitutivo.update(esquema_substitutivo_params)
      redirect_to @esquema_substitutivo, notice: 'Esquema substitutivo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /esquema_substitutivos/1
  def destroy
    @esquema_substitutivo.destroy
    redirect_to esquema_substitutivos_url, notice: 'Esquema substitutivo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esquema_substitutivo
      @esquema_substitutivo = EsquemaSubstitutivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def esquema_substitutivo_params
      params.require(:esquema_substitutivo).permit(:miligramas, :medicamento_id, :notificacao_id)
    end
end
