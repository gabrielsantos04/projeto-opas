class DermatologicasController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_dermatologica, only: [:show, :edit, :update, :destroy]

  # GET /dermatologicas
  def index
    @q = Dermatologica.all.ransack(params[:q])
    @dermatologicas = @q.result.page(params[:page])
  end

  # GET /dermatologicas/1
  def show
  end

  # GET /dermatologicas/new
  def new
    @dermatologica = Dermatologica.new
  end

  # GET /dermatologicas/1/edit
  def edit
  end

  # POST /dermatologicas
  def create
    @dermatologica = Dermatologica.new(dermatologica_params)

    if @dermatologica.save
      redirect_to dermatologicas_path, notice: 'Dermatologica was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dermatologicas/1
  def update
    if @dermatologica.update(dermatologica_params)
      redirect_to dermatologicas_path, notice: 'Dermatologica was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dermatologicas/1
  def destroy
    @dermatologica.destroy
    redirect_to dermatologicas_url, notice: 'Dermatologica was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dermatologica
      @dermatologica = Dermatologica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dermatologica_params
      params.require(:dermatologica).permit(:nome)
    end
end
