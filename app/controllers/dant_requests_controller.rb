#Classe que controla as açoes da DantRequest
class DantRequestsController < ApplicationController
  before_action :set_dant_request, only: [:show, :edit, :update, :destroy,:enviar,:faixa_etaria,:alterar_status]
  before_action :set_combos, only: [:new, :edit, :create]

  def dashboard
    @cidades = Cidade.all.order(:nome).map{|a| [a.nome,a.id]}
    @regioes = DantRegion.all.order(:nome).map{|a| [a.nome,a.id]}
    if current_user.administrador? || current_user.admin_dant
      @q = DantRequest.all.ransack(params[:q])
    else
      @q = DantRequest.where(cidade: current_user.cidade).ransack(params[:q])
    end

    @dant_requests = @q.result
  end

  # GET /dant_requests
  def index

    @cidades = Cidade.all.order(:nome).map{|a| [a.nome,a.id]}
    @regioes = DantRegion.all.order(:nome).map{|a| [a.nome,a.id]}
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

  #Método que retorna os pacientes para o relatório de faixa etária
  def faixa_etaria
    @pacientes = @dant_request.dant_request_pacients
  end

  #Método que altera o status da solicitacão
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

  #Método que envia a solicitação
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
    @dant_request.dant_faixa_etarias.build
    if current_user.administrador?
      pacientes = DantPacient.where(cidade_id: current_user.cidade_id).where.not(obito: true)
      insulinas = DantDose.all
      #@dant_request.qtd_hipertensos = pacientes.where(hipertenso: true).count #refatorar
      @dant_request.atendimento_hipertensos = 0
      @dant_request.qtd_obitos_hipertensos = 0
      #@dant_request.qtd_diabeticos = pacientes.where(diabetico: true).count #refatorar
      @dant_request.atendimento_diabeticos = 0
      @dant_request.qtd_obitos_diabeticos = 0
      #@dant_request.qtd_diabeticos_hipertencos = pacientes.where(hipertenso: true, diabetico: true).count #refatorar
      @dant_request.atendimento_diabeticos_hipertensos = 0
      @dant_request.qtd_tratamento_hemodialise = 0
      @dant_request.qtd_nph = insulinas.where(tipo_insulina: "nph_frascos").count
      @dant_request.qtd_frascos_nph = insulinas.where(tipo_insulina: "nph_frascos").sum(:frascos_mensais)
      @dant_request.qtd_regular = insulinas.where(tipo_insulina: "regular_frascos").count
      @dant_request.qtd_frascos_regular = insulinas.where(tipo_insulina: "regular_frascos").sum(:frascos_mensais)
      @dant_request.qtd_nph_caneta = insulinas.where(tipo_insulina: "nph_de_caneta").count
      @dant_request.qtd_frascos_nph_caneta = insulinas.where(tipo_insulina: "nph_de_caneta").sum(:frascos_mensais)
      @dant_request.qtd_regular_caneta = insulinas.where(tipo_insulina: "regular_de_caneta").count
      @dant_request.qtd_frascos_regular_caneta = insulinas.where(tipo_insulina: "regular_de_caneta").sum(:frascos_mensais)
     # @dant_request.qtd_analoga = pacientes.where(tipo_insulina: "analoga").count
     # @dant_request.qtd_frascos_analoga = pacientes.where(tipo_insulina: "analoga").sum(:frascos_mensais)
      #@dant_request.qtd_tabagista = pacientes.where(tabagista: true).count #refatorar
      @dant_request.qtd_atendimento_tabagista = 0
     # @dant_request.qtd_etilista = pacientes.where(etilista: true).count #refatorar
      @dant_request.qtd_atendimento_etilista = 0
     # @dant_request.qtd_obesos = pacientes.where(obeso: true).count #refatorar
      @dant_request.qtd_obesidade_1 = 0#pacientes.where(grau_obesidade: 1).count
      @dant_request.qtd_obesidate_2 = 0#pacientes.where(grau_obesidade: 2).count
      @dant_request.qtd_obesidade_3 = 0#pacientes.where(grau_obesidade: 3).count
      pacientes.each do |p|
        @dant_request.dant_request_pacients.build(dant_pacient_id:p.id, frascos_diarios: p.dant_doses.sum(:dose_diaria), frascos_mensais: p.dant_doses.sum(:frascos_mensais), idade: p.idade, hipertenso: p.hipertenso, diabetico: p.diabetico,sexo: p.sexo_value)
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
  #Método que seta os objetos utilizados nos formulários
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
      params.require(:dant_request).permit(:soma_participacoes,:justificativa,:qtd_hipertensos, :atendimento_hipertensos, :qtd_obitos_hipertensos, :qtd_diabeticos, :atendimento_diabeticos, :qtd_obitos_diabeticos, :qtd_diabeticos_hipertencos, :atendimento_diabeticos_hipertensos, :qtd_tratamento_hemodialise, :qtd_nph, :qtd_frascos_nph, :qtd_regular, :qtd_frascos_regular,:qtd_nph_caneta, :qtd_frascos_nph_caneta, :qtd_regular_caneta, :qtd_frascos_regular_caneta, :qtd_analoga, :qtd_frascos_analoga, :qtd_tabagista, :qtd_atendimento_tabagista, :qtd_etilista, :qtd_atendimento_etilista, :qtd_obesos, :qtd_obesidade_1, :qtd_obesidate_2, :qtd_obesidade_3, :mes, :dant_responsavel_program_id, :cidade_id, :status,
      dant_request_pacients_attributes:[:sexo,:hipertenso,:diabetico,:obeso,:tabagista,:etilista,:id,:dant_request_id,:dant_pacient_id,:frascos_diarios,:frascos_mensais,:idade],
                                           dant_faixa_etarias_attributes:[:hipertenso_m_1 ,:hipertenso_m_1_4 ,:hipertenso_m_5_9 ,:hipertenso_m_10_14 ,:hipertenso_m_15_19 ,:hipertenso_m_20_29 ,:hipertenso_m_30_39 ,:hipertenso_m_40_49 ,:hipertenso_m_50_59 ,:hipertenso_m_60_69 ,:hipertenso_m_70_79 ,:hipertenso_m_80 ,:hipertenso_f_1 ,:hipertenso_f_1_4 ,:hipertenso_f_5_9 ,:hipertenso_f_10_14 ,:hipertenso_f_15_19 ,:hipertenso_f_20_29 ,:hipertenso_f_30_39 ,:hipertenso_f_40_49 ,:hipertenso_f_50_59 ,:hipertenso_f_60_69 ,:hipertenso_f_70_79 ,:hipertenso_f_80 ,:diabetico_m_1 ,:diabetico_m_1_4 ,:diabetico_m_5_9 ,:diabetico_m_10_14 ,:diabetico_m_15_19 ,:diabetico_m_20_29 ,:diabetico_m_30_39 ,:diabetico_m_40_49 ,:diabetico_m_50_59 ,:diabetico_m_60_69 ,:diabetico_m_70_79 ,:diabetico_m_90 ,:diabetico_f_1 ,:diabetico_f_1_4 ,:diabetico_f_5_9 ,:diabetico_f_10_14 ,:diabetico_f_15_19 ,:diabetico_f_20_29 ,:diabetico_f_30_39 ,:diabetico_f_40_49 ,:diabetico_f_50_59 ,:diabetico_f_60_69 ,:diabetico_f_70_79 ,:diabetico_f_80 ,:diabetico_hipertenso_m_1 ,:diabetico_hipertenso_m_1_4 ,:diabetico_hipertenso_m_5_9 ,:diabetico_hipertenso_m_10_14 ,:diabetico_hipertenso_m_15_19 ,:diabetico_hipertenso_m_20_29 ,:diabetico_hipertenso_m_30_39 ,:diabetico_hipertenso_m_40_49 ,:diabetico_hipertenso_m_50_59 ,:diabetico_hipertenso_m_60_69 ,:diabetico_hipertenso_m_70_79 ,:diabetico_hipertenso_m_80 ,:diabetico_hipertenso_f_1 ,:diabetico_hipertenso_f_1_4 ,:diabetico_hipertenso_f_5_9 ,:diabetico_hipertenso_f_10_14 ,:diabetico_hipertenso_f_15_19 ,:diabetico_hipertenso_f_20_29 ,:diabetico_hipertenso_f_30_39 ,:diabetico_hipertenso_f_40_49 ,:diabetico_hipertenso_f_50_59 ,:diabetico_hipertenso_f_60_69 ,:diabetico_hipertenso_f_70_79 ,:diabetico_hipertenso_f_80 ,:obeso_m_1 ,:obeso_m_1_4 ,:obeso_m_5_9 ,:obeso_m_10_14 ,:obeso_m_15_19 ,:obeso_m_20_29 ,:obeso_m_30_39 ,:obeso_m_40_49 ,:obeso_m_50_59 ,:obeso_m_60_69 ,:obeso_m_70_79 ,:obeso_m_80 ,:obeso_f_1 ,:obeso_f_1_4 ,:obeso_f_5_9 ,:obeso_f_10_14 ,:obeso_f_15_19 ,:obeso_f_20_29 ,:obeso_f_30_39 ,:obeso_f_40_49 ,:obeso_f_50_59 ,:obeso_f_60_69 ,:obeso_f_70_79 ,:obeso_f_80 ,:tabagismo_m_1_8 ,:tabagismo_m_9_11 ,:tabagismo_m_12_17 ,:tabagismo_m_18_24 ,:tabagismo_m_25_34 ,:tabagismo_m_35_44 ,:tabagismo_m_45_54 ,:tabagismo_m_55_64 ,:tabagismo_m_65 ,:tabagismo_f_1_8 ,:tabagismo_f_9_11 ,:tabagismo_f_12_17 ,:tabagismo_f_18_24 ,:tabagismo_f_25_34 ,:tabagismo_f_35_44 ,:tabagismo_f_45_54 ,:tabagismo_f_55_64 ,:tabagismo_f_65 ,:etilismo_m_1_8 ,:etilismo_m_9_11 ,:etilismo_m_12_17 ,:etilismo_m_18_24 ,:etilismo_m_25_34 ,:etilismo_m_35_44 ,:etilismo_m_45_54 ,:etilismo_m_55_64 ,:etilismo_m_65 ,:etilismo_f_1_8 ,:etilismo_f_9_11 ,:etilismo_f_12_17 ,:etilismo_f_18_24 ,:etilismo_f_25_34 ,:etilismo_f_35_44 ,:etilismo_f_45_54 ,:etilismo_f_55_64 ,:etilismo_f_65])
    end
end
