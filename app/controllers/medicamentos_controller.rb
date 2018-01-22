class MedicamentosController < ApplicationController
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
      redirect_to @medicamento, notice: 'Medicamento was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /medicamentos/1
  def update
    if @medicamento.update(medicamento_params)
      redirect_to @medicamento, notice: 'Medicamento was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /medicamentos/1
  def destroy
    @medicamento.destroy
    redirect_to medicamentos_url, notice: 'Medicamento was successfully destroyed.'
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
