#Classe que controla as açoes da DantResponsavelPrograms
class DantResponsavelProgramsController < ApplicationController
  before_action :set_dant_responsavel_program, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /dant_responsavel_programs
  def index
    @cidades = Cidade.all.order(:nome).map{|a| [a.nome,a.id]}
    if current_user.administrador? || current_user.admin_dant
      @q = DantResponsavelProgram.all.ransack(params[:q])
    else
      @q = DantResponsavelProgram.where(cidade: current_user.cidade).ransack(params[:q])
    end

    @dant_responsavel_programs = @q.result.page(params[:page])
  end

  # GET /dant_responsavel_programs/1
  def show
  end

  # GET /dant_responsavel_programs/new
  def new
    @dant_responsavel_program = DantResponsavelProgram.new
  end

  # GET /dant_responsavel_programs/1/edit
  def edit
  end

  # POST /dant_responsavel_programs
  def create
    @dant_responsavel_program = DantResponsavelProgram.new(dant_responsavel_program_params)

    if @dant_responsavel_program.save
      redirect_to @dant_responsavel_program, notice: 'Dant responsavel program was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dant_responsavel_programs/1
  def update
    if @dant_responsavel_program.update(dant_responsavel_program_params)
      redirect_to @dant_responsavel_program, notice: 'Dant responsavel program was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dant_responsavel_programs/1
  def destroy
    @dant_responsavel_program.destroy
    redirect_to dant_responsavel_programs_url, notice: 'Dant responsavel program was successfully destroyed.'
  end

  private
  def set_combos
    @cidades = Cidade.all.order(:nome).map{|a| [a.nome, a.id]}
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_responsavel_program
      @dant_responsavel_program = DantResponsavelProgram.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_responsavel_program_params
      params.require(:dant_responsavel_program).permit(:nome, :cargo, :cidade_id)
    end
end
