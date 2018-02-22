class AvaliacaoNeurologicasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_avaliacao_neurologica, only: [:show, :edit, :update, :destroy]

  # GET /avaliacao_neurologicas
  def index
    @q = AvaliacaoNeurologica.all.ransack(params[:q])
    @avaliacao_neurologicas = @q.result.page(params[:page])
  end

  # GET /avaliacao_neurologicas/1
  def show
  end

  # GET /avaliacao_neurologicas/new
  def new
    @avaliacao_neurologica = AvaliacaoNeurologica.new
  end

  # GET /avaliacao_neurologicas/1/edit
  def edit
  end

  # POST /avaliacao_neurologicas
  def create
    @avaliacao_neurologica = AvaliacaoNeurologica.new(avaliacao_neurologica_params)

    if @avaliacao_neurologica.save
      redirect_to @avaliacao_neurologica, notice: 'Avaliacao neurologica was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /avaliacao_neurologicas/1
  def update
    if @avaliacao_neurologica.update(avaliacao_neurologica_params)
      redirect_to @avaliacao_neurologica, notice: 'Avaliacao neurologica was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /avaliacao_neurologicas/1
  def destroy
    @avaliacao_neurologica.destroy
    redirect_to avaliacao_neurologicas_url, notice: 'Avaliacao neurologica was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_neurologica
      @avaliacao_neurologica = AvaliacaoNeurologica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def avaliacao_neurologica_params
      params.require(:avaliacao_neurologica).permit(:queixa_id, :avaliacao_notificacao_id, :direito, :esquerdo, :data)
    end
end
