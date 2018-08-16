class MonthlyReportsController < ApplicationController
  before_action :set_monthly_report, only: [:show, :edit, :update, :destroy]
  before_action :set_combos, only: [:new, :create, :edit]
  # GET /monthly_reports
  def index
    if current_user.administrador? || current_user.admin_hans?
      @q = MonthlyReport.all.ransack(params[:q])
    else
      @q = MonthlyReport.where(cidade: current_user.cidade).ransack(params[:q])
    end

    @monthly_reports = @q.result.page(params[:page])
  end

  # GET /monthly_reports/1
  def show
  end

  # GET /monthly_reports/new
  def new
    @monthly_report = MonthlyReport.new
    @monthly_report.cidade = current_user.cidade
  end

  # GET /monthly_reports/1/edit
  def edit
  end

  # POST /monthly_reports
  def create
    @monthly_report = MonthlyReport.new(monthly_report_params)

    if @monthly_report.save
      redirect_to @monthly_report, notice: 'Monthly report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /monthly_reports/1
  def update
    if @monthly_report.update(monthly_report_params)
      redirect_to @monthly_report, notice: 'Monthly report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /monthly_reports/1
  def destroy
    @monthly_report.destroy
    redirect_to monthly_reports_url, notice: 'Monthly report was successfully destroyed.'
  end

  private
  def set_combos
    @cidades = Cidade.all.sort_by{|a| a.nome}.map{|a| [a.nome,a.id]}

  end
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_report
      @monthly_report = MonthlyReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def monthly_report_params
      params.require(:monthly_report).permit(:nome_grupo, :coordenador, :monitor, :lider, :data_reuniao, :inicio, :termino, :local, :temas, :atividades_desenvolvidas, :data_proximo, :intercorrencia, :outros_agravos, :agravo_diabetes, :agravo_hipertensao, :agravo_avc, :analfabetos, :qtd_psicologo, :qtd_assistente_social, :oficina_sapataria, :qtd_hanseniase, :qtd_sem_hanseniase, :qtd_profissionais, :cidade_id)
    end
end
