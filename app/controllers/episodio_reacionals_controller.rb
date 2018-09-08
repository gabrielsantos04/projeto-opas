#Classe que controla as açoes da EpisodioReacional
class EpisodioReacionalsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_episodio_reacional, only: [:show, :edit, :update, :destroy]

  # GET /episodio_reacionals
  def index
    @q = EpisodioReacional.all.ransack(params[:q])
    @episodio_reacionals = @q.result.page(params[:page])
  end

  # GET /episodio_reacionals/1
  def show
  end

  # GET /episodio_reacionals/new
  def new
    @episodio_reacional = EpisodioReacional.new
  end

  # GET /episodio_reacionals/1/edit
  def edit
  end

  # POST /episodio_reacionals
  def create
    @episodio_reacional = EpisodioReacional.new(episodio_reacional_params)

    if @episodio_reacional.save
      redirect_to @episodio_reacional, notice: 'Episodio reacional was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /episodio_reacionals/1
  def update
    if @episodio_reacional.update(episodio_reacional_params)
      redirect_to @episodio_reacional, notice: 'Episodio reacional was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /episodio_reacionals/1
  def destroy
    @episodio_reacional.destroy
    redirect_to episodio_reacionals_url, notice: 'Episodio reacional was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episodio_reacional
      @episodio_reacional = EpisodioReacional.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def episodio_reacional_params
      params.require(:episodio_reacional).permit(:notificacao_id, :tipo, :numero_episodios, :conduta_mendicamentosa, :data_inicio, :data_termino)
    end
end
