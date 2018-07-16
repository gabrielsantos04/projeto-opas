class DantRequestsController < ApplicationController
  before_action :set_dant_request, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /dant_requests
  def index
    @q = DantRequest.all.ransack(params[:q])
    @dant_requests = @q.result.page(params[:page])
  end

  # GET /dant_requests/1
  def show
  end

  # GET /dant_requests/new
  def new
    @dant_request = DantRequest.new
    if current_user.administrador?
      pacientes = DantPacient.where(cidade_id: current_user.cidade_id).where.not(obito: true)
      @dant_request.qtd_hipertensos = pacientes.where(hipertenso: true).count
      @dant_request.atendimento_hipertensos = 0
      @dant_request.qtd_obitos_hipertensos = 0
      @dant_request.qtd_diabeticos = pacientes.where(diabetico: true).count
      @dant_request.atendimento_diabeticos = 0
      @dant_request.qtd_obitos_diabeticos = 0
      @dant_request.qtd_diabeticos_hipertencos = pacientes.where(hipertenso: true, diabetico: true).count
      @dant_request.atendimento_diabeticos_hipertensos = 0
      @dant_request.qtd_tratamento_hemodialise = 0
      @dant_request.qtd_nph = pacientes.where(tipo_insulina: "nph").count
      @dant_request.qtd_frascos_nph = pacientes.where(tipo_insulina: "nph").sum(:frascos_mensais)
      @dant_request.qtd_regular = pacientes.where(tipo_insulina: "regular").count
      @dant_request.qtd_frascos_regular = pacientes.where(tipo_insulina: "regular").sum(:frascos_mensais)
      @dant_request.qtd_analoga = pacientes.where(tipo_insulina: "analoga").count
      @dant_request.qtd_frascos_analoga = pacientes.where(tipo_insulina: "analoga").sum(:frascos_mensais)
      @dant_request.qtd_tabagista = pacientes.where(tabagista: true).count
      @dant_request.qtd_atendimento_tabagista = 0
      @dant_request.qtd_etilista = pacientes.where(etilista: true).count
      @dant_request.qtd_atendimento_etilista = 0
      @dant_request.qtd_obesos = pacientes.where(obeso: true).count
      @dant_request.qtd_obesidade_1 = pacientes.where(grau_obesidade: 1).count
      @dant_request.qtd_obesidate_2 = pacientes.where(grau_obesidade: 2).count
      @dant_request.qtd_obesidade_3 = pacientes.where(grau_obesidade: 3).count
    end
    @dant_request.cidade_id = current_user.cidade_id

  end

  # GET /dant_requests/1/edit
  def edit
  end

  # POST /dant_requests
  def create
    @dant_request = DantRequest.new(dant_request_params)

    if @dant_request.save
      redirect_to @dant_request, notice: 'Dant request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dant_requests/1
  def update
    if @dant_request.update(dant_request_params)
      redirect_to @dant_request, notice: 'Dant request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dant_requests/1
  def destroy
    @dant_request.destroy
    redirect_to dant_requests_url, notice: 'Dant request was successfully destroyed.'
  end

  private
  def set_combos
    @responsaveis = DantResponsavelProgram.all.order(:nome).map{|a| [a.nome,a.id]}
    @cidades = Cidade.all.order(:nome).map{|a| [a.nome,a.id]}
    @pacientes = current_user.administrador? ? DantPacient.all.order(:nome).map{|a| [a.nome,a.id]} : DantPacient.where(cidade_id: current_user.cidade_id).order(:nome).map{|a| [a.nome,a.id]}
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_request
      @dant_request = DantRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_request_params
      params.require(:dant_request).permit(:qtd_hipertensos, :atendimento_hipertensos, :qtd_obitos_hipertensos, :qtd_diabeticos, :atendimento_diabeticos, :qtd_obitos_diabeticos, :qtd_diabeticos_hipertencos, :atendimento_diabeticos_hipertensos, :qtd_tratamento_hemodialise, :qtd_nph, :qtd_frascos_nph, :qtd_regular, :qtd_frascos_regular, :qtd_analoga, :qtd_frascos_analoga, :qtd_tabagista, :qtd_atendimento_tabagista, :qtd_etilista, :qtd_atendimento_etilista, :qtd_obesos, :qtd_obesidade_1, :qtd_obesidate_2, :qtd_obesidade_3, :mes, :dant_responsavel_program_id, :cidade_id, :status)
    end
end
