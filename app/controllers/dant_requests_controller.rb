class DantRequestsController < ApplicationController
  before_action :set_dant_request, only: [:show, :edit, :update, :destroy]

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
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_request
      @dant_request = DantRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_request_params
      params.require(:dant_request).permit(:qtd_hipertensos, :atendimento_hipertensos, :qtd_obitos_hipertensos, :qtd_diabeticos, :atendimento_diabeticos, :qtd_obitos_diabeticos, :qtd_diabeticos_hipertencos, :atendimento_diabeticos_hipertensos, :qtd_tratamento_hemodialise, :qtd_nph, :qtd_frascos_nph, :qtd_regular, :qtd_frascos_regular, :qtd_analoga, :qtd_frascos_analoga, :qtd_tabagista, :qtd_atendimento_tabagista, :qtd_etilista, :qtd_atendimento_etilista, :qtd_obesos, :qtd_obesidade_1, :qtd_obesidate_2, :qtd_obesidade_3, :mes, :dant_responsavel_program_id, :cidade_id, :status)
    end
end
