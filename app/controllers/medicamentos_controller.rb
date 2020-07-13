#Classe que controla as açoes da Medicamentos
class MedicamentosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_medicamento, only: [:show, :edit, :update, :destroy]

  # GET /medicamentos
  def index
    @q = Medicamento.all.ransack(params[:q])
    @medicamentos = @q.result.page(params[:page])
  end

  # GET /medicamentos/1
  def show
  end

  # GET /medicamentos/new
  def new
    @medicamento = Medicamento.new
  end

  # GET /medicamentos/1/edit
  def edit
  end

  # POST /medicamentos
  def create
    @medicamento = Medicamento.new(medicamento_params)

    if @medicamento.save
      redirect_to @medicamento, notice: 'Medicamento criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /medicamentos/1
  def update
    if @medicamento.update(medicamento_params)
      redirect_to @medicamento, notice: 'Medicamento atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /medicamentos/1
  def destroy
    @medicamento.destroy
    redirect_to medicamentos_url, notice: 'Medicamento excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicamento
      @medicamento = Medicamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medicamento_params
      params.require(:medicamento).permit(:nome)
    end
end
