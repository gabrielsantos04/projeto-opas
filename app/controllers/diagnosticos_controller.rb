#Classe que controla as açoes da Diagnosticos
class DiagnosticosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_diagnostico, only: [:show, :edit, :update, :destroy]

  # GET /diagnosticos
  def index
    @q = Diagnostico.all.ransack(params[:q])
    @diagnosticos = @q.result.page(params[:page])
  end

  # GET /diagnosticos/1
  def show
  end

  # GET /diagnosticos/new
  def new
    @diagnostico = Diagnostico.new
  end

  # GET /diagnosticos/1/edit
  def edit
  end

  # POST /diagnosticos
  def create
    @diagnostico = Diagnostico.new(diagnostico_params)

    if @diagnostico.save
      redirect_to diagnosticos_path, notice: 'Diagnostico was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /diagnosticos/1
  def update
    if @diagnostico.update(diagnostico_params)
      redirect_to diagnosticos_path, notice: 'Diagnostico was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /diagnosticos/1
  def destroy
    @diagnostico.destroy
    redirect_to diagnosticos_url, notice: 'Diagnostico was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostico
      @diagnostico = Diagnostico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diagnostico_params
      params.require(:diagnostico).permit(:nome)
    end
end
