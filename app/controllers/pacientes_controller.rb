#Classe que controla as açoes da Paciente
class PacientesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :create, :edit]

  # GET /pacientes
  def index
    if current_user.administrador?
      @q = Paciente.all.ransack(params[:q])
    else
      @q = Paciente.where(cidade: current_user.cidade).ransack(params[:q])
    end

    @pacientes = @q.result.page(params[:page])
  end

  # GET /pacientes/1
  def show
  end

  #Método que retorna o mapa dos pacientes
  def mapa

    @pacientes = Paciente.all
    @cidades = Cidade.where(id: @pacientes.pluck(:cidade_id))
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new(cidade_id: current_user.cidade.id)
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes
  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      redirect_to @paciente, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /pacientes/1
  def update
    if @paciente.update(paciente_params)
      redirect_to @paciente, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /pacientes/1
  def destroy
    @paciente.destroy
    redirect_to pacientes_url, notice: 'Paciente excluído com sucesso.'
  end

  private

  #Método utilizado para setar os objetos utilizados no formulário
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
