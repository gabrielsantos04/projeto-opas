class DantRequestsController < ApplicationController
  before_action :set_dant_request, only: [:show, :edit, :update, :destroy,:enviar,:faixa_etaria,:alterar_status]
  before_action :set_combos, only: [:new, :edit, :create]

  # GET /dant_requests
  def index
    @cidades = Cidade.all.order(:nome).map{|a| [a.nome,a.id]}
    if current_user.administrador? || current_user.admin_dant
      @q = DantRequest.all.ransack(params[:q])
    else
      @q = DantRequest.where(cidade: current_user.cidade).ransack(params[:q])
    end

    @dant_requests = @q.result.page(params[:page])
  end

  # GET /dant_requests/1
  def show
  end

  def faixa_etaria
    @pacientes = @dant_request.dant_request_pacients
  end

  def alterar_status
    case params[:status]
      when "deferido"
        @dant_request.status = :deferido
      when "indeferido"
        @dant_request.status = :indeferido
      when "entregue"
        @dant_request.status = :entregue
    end
    @dant_request.save

    redirect_to @dant_request, notice: "Solicitação #{params[:status].upcase}"
  end

  def enviar
    @dant_request.status = :solicitado


    @dant_request.data_envio = DateTime.now
    @dant_request.calcular_quantidades
    @dant_request.save

    redirect_to dant_requests_path
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
      pacientes.each do |p|
        @dant_request.dant_request_pacients.build(dant_pacient_id:p.id, frascos_diarios: p.frascos_diarios, frascos_mensais: p.frascos_mensais, idade: p.idade, hipertenso: p.hipertenso, diabetico: p.diabetico, etilista: p.etilista, tabagista: p.tabagista, obeso: p.obeso,sexo: p.sexo_value)
      end
    end
    @dant_request.cidade_id = current_user.cidade_id

  end

  # GET /dant_requests/1/edit
  def edit
    if @dant_request.status != :cadastrada and ( !current_user.administrador? and !current_user.admin_dant?)
      redirect_to dant_requests_path, notice: "Não é possível editar a solicitação nesta etapa!"
    end
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
      params.require(:dant_request).permit(:qtd_hipertensos, :atendimento_hipertensos, :qtd_obitos_hipertensos, :qtd_diabeticos, :atendimento_diabeticos, :qtd_obitos_diabeticos, :qtd_diabeticos_hipertencos, :atendimento_diabeticos_hipertensos, :qtd_tratamento_hemodialise, :qtd_nph, :qtd_frascos_nph, :qtd_regular, :qtd_frascos_regular, :qtd_analoga, :qtd_frascos_analoga, :qtd_tabagista, :qtd_atendimento_tabagista, :qtd_etilista, :qtd_atendimento_etilista, :qtd_obesos, :qtd_obesidade_1, :qtd_obesidate_2, :qtd_obesidade_3, :mes, :dant_responsavel_program_id, :cidade_id, :status,
      dant_request_pacients_attributes:[:sexo,:hipertenso,:diabetico,:obeso,:tabagista,:etilista,:id,:dant_request_id,:dant_pacient_id,:frascos_diarios,:frascos_mensais,:idade])
    end
end
