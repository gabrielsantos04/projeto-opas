class DantFaixaEtariaController < ApplicationController
  before_action :set_dant_faixa_etarium, only: [:show, :edit, :update, :destroy]

  # GET /dant_faixa_etaria
  def index
    @q = DantFaixaEtarium.all.ransack(params[:q])
    @dant_faixa_etaria = @q.result.page(params[:page])
  end

  # GET /dant_faixa_etaria/1
  def show
  end

  # GET /dant_faixa_etaria/new
  def new
    @dant_faixa_etarium = DantFaixaEtarium.new
  end

  # GET /dant_faixa_etaria/1/edit
  def edit
  end

  # POST /dant_faixa_etaria
  def create
    @dant_faixa_etarium = DantFaixaEtarium.new(dant_faixa_etarium_params)

    if @dant_faixa_etarium.save
      redirect_to @dant_faixa_etarium, notice: 'Dant faixa etarium was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dant_faixa_etaria/1
  def update
    if @dant_faixa_etarium.update(dant_faixa_etarium_params)
      redirect_to @dant_faixa_etarium, notice: 'Dant faixa etarium was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dant_faixa_etaria/1
  def destroy
    @dant_faixa_etarium.destroy
    redirect_to dant_faixa_etaria_url, notice: 'Dant faixa etarium was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_faixa_etarium
      @dant_faixa_etarium = DantFaixaEtarium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_faixa_etarium_params
      params.require(:dant_faixa_etarium).permit(:hipertenso_m_1, :hipertenso_m_1_4, :hipertenso_m_5_9, :hipertenso_m_10_14, :hipertenso_m_15_19, :hipertenso_m_20_29, :hipertenso_m_30_39, :hipertenso_m_40_49, :hipertenso_m_50_59, :hipertenso_m_60_69, :hipertenso_m_70_79, :hipertenso_m_80, :hipertenso_f_1, :hipertenso_f_1_4, :hipertenso_f_5_9, :hipertenso_f_10_14, :hipertenso_f_15_19, :hipertenso_f_20_29, :hipertenso_f_30_39, :hipertenso_f_40_49, :hipertenso_f_50_59, :hipertenso_f_60_69, :hipertenso_f_70_79, :hipertenso_f_80, :diabetico_m_1, :diabetico_m_1_4, :diabetico_m_5_9, :diabetico_m_10_14, :diabetico_m_15_19, :diabetico_m_20_29, :diabetico_m_30_39, :diabetico_m_40_49, :diabetico_m_50_59, :diabetico_m_60_69, :diabetico_m_70_79, :diabetico_m_90, :diabetico_f_1, :diabetico_f_1_4, :diabetico_f_5_9, :diabetico_f_10_14, :diabetico_f_15_19, :diabetico_f_20_29, :diabetico_f_30_39, :diabetico_f_40_49, :diabetico_f_50_59, :diabetico_f_60_69, :diabetico_f_70_79, :diabetico_f_80, :diabetico_hipertenso_m_1, :diabetico_hipertenso_m_1_4, :diabetico_hipertenso_m_5_9, :diabetico_hipertenso_m_10_14, :diabetico_hipertenso_m_15_19, :diabetico_hipertenso_m_20_29, :diabetico_hipertenso_m_30_39, :diabetico_hipertenso_m_40_49, :diabetico_hipertenso_m_50_59, :diabetico_hipertenso_m_60_69, :diabetico_hipertenso_m_70_79, :diabetico_hipertenso_m_80, :diabetico_hipertenso_f_1, :diabetico_hipertenso_f_1_4, :diabetico_hipertenso_f_5_9, :diabetico_hipertenso_f_10_14, :diabetico_hipertenso_f_15_19, :diabetico_hipertenso_f_20_29, :diabetico_hipertenso_f_30_39, :diabetico_hipertenso_f_40_49, :diabetico_hipertenso_f_50_59, :diabetico_hipertenso_f_60_69, :diabetico_hipertenso_f_70_79, :diabetico_hipertenso_f_80, :obeso_m_1, :obeso_m_1_4, :obeso_m_5_9, :obeso_m_10_14, :obeso_m_15_19, :obeso_m_20_29, :obeso_m_30_39, :obeso_m_40_49, :obeso_m_50_59, :obeso_m_60_69, :obeso_m_70_79, :obeso_m_80, :obeso_f_1, :obeso_f_1_4, :obeso_f_5_9, :obeso_f_10_14, :obeso_f_15_19, :obeso_f_20_29, :obeso_f_30_39, :obeso_f_40_49, :obeso_f_50_59, :obeso_f_60_69, :obeso_f_70_79, :obeso_f_80, :tabagismo_m_1_8, :tabagismo_m_9_11, :tabagismo_m_12_17, :tabagismo_m_18_24, :tabagismo_m_25_34, :tabagismo_m_35_44, :tabagismo_m_45_54, :tabagismo_m_55_64, :tabagismo_m_65, :tabagismo_f_1_8, :tabagismo_f_9_11, :tabagismo_f_12_17, :tabagismo_f_18_24, :tabagismo_f_25_34, :tabagismo_f_35_44, :tabagismo_f_45_54, :tabagismo_f_55_64, :tabagismo_f_65, :etilismo_m_1_8, :etilismo_m_9_11, :etilismo_m_12_17, :etilismo_m_18_24, :etilismo_m_25_34, :etilismo_m_35_44, :etilismo_m_45_54, :etilismo_m_55_64, :etilismo_m_65, :etilismo_f_1_8, :etilismo_f_9_11, :etilismo_f_12_17, :etilismo_f_18_24, :etilismo_f_25_34, :etilismo_f_35_44, :etilismo_f_45_54, :etilismo_f_55_64, :etilismo_f_65, :dant_request_id)
    end
end
