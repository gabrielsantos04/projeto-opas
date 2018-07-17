class DantPacientsController < ApplicationController
  before_action :set_dant_pacient, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /dant_pacients
  def index
    @q = DantPacient.all.ransack(params[:q])
    @dant_pacients = @q.result.page(params[:page])
  end

  # GET /dant_pacients/1
  def show
  end

  # GET /dant_pacients/new
  def new
    @dant_pacient = DantPacient.new
  end

  # GET /dant_pacients/1/edit
  def edit
  end

  # POST /dant_pacients
  def create
    @dant_pacient = DantPacient.new(dant_pacient_params)

    if @dant_pacient.save
      redirect_to @dant_pacient, notice: 'Paciente cadastrado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /dant_pacients/1
  def update
    if @dant_pacient.update(dant_pacient_params)
      redirect_to @dant_pacient, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /dant_pacients/1
  def destroy
    @dant_pacient.destroy
    redirect_to dant_pacients_url, notice: 'Paciente removido com sucesso.'
  end

  private
  def set_combos
    @cidades = Cidade.all.order(:nome).map{|a| [a.nome, a.id]}
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_pacient
      @dant_pacient = DantPacient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_pacient_params
      params.require(:dant_pacient).permit(:nome, :sexo, :endereco, :rg, :cpf, :frascos_diarios, :frascos_mensais, :tipo_insulina, :hipertenso, :diabetico, :tabagista, :etilista, :obeso, :grau_obesidade, :cidade_id, :obito, :data_obito,:data_nascimento)
    end
end
