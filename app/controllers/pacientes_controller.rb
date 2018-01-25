class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :create, :edit]

  # GET /pacientes
  def index
    @q = Paciente.all.ransack(params[:q])
    @pacientes = @q.result.page(params[:page])
  end

  # GET /pacientes/1
  def show
  end

  def mapa
    @pacientes = Paciente.all
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes
  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      redirect_to @paciente, notice: 'Paciente was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pacientes/1
  def update
    if @paciente.update(paciente_params)
      redirect_to @paciente, notice: 'Paciente was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pacientes/1
  def destroy
    @paciente.destroy
    redirect_to pacientes_url, notice: 'Paciente was successfully destroyed.'
  end

  private

  def set_combos
    @cidades = Cidade.all.sort_by{|a| a.nome}.map{|a| [a.nome,a.id]}
    @ocupacoes = Ocupacao.all.sort_by{|a| a.nome}.map{|a| [a.nome,a.id]}
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paciente_params
      params.require(:paciente).permit(:nome, :nome_mae, :idade, :peso, :endereco, :latitude, :longitude, :sexo, :telefone, :cidade_id, :ocupacao_id)
    end
end
