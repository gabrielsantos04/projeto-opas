class ClassificacaoGrausController < ApplicationController
  before_action :set_classificacao_grau, only: [:show, :edit, :update, :destroy]

  # GET /classificacao_graus
  def index
    @q = ClassificacaoGrau.all.ransack(params[:q])
    @classificacao_graus = @q.result.page(params[:page])
  end

  # GET /classificacao_graus/1
  def show
  end

  # GET /classificacao_graus/new
  def new
    @classificacao_grau = ClassificacaoGrau.new
  end

  # GET /classificacao_graus/1/edit
  def edit
  end

  # POST /classificacao_graus
  def create
    @classificacao_grau = ClassificacaoGrau.new(classificacao_grau_params)

    if @classificacao_grau.save
      redirect_to @classificacao_grau, notice: 'Classificacao grau was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /classificacao_graus/1
  def update
    if @classificacao_grau.update(classificacao_grau_params)
      redirect_to @classificacao_grau, notice: 'Classificacao grau was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /classificacao_graus/1
  def destroy
    @classificacao_grau.destroy
    redirect_to classificacao_graus_url, notice: 'Classificacao grau was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classificacao_grau
      @classificacao_grau = ClassificacaoGrau.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classificacao_grau_params
      params.require(:classificacao_grau).permit(:avaliacao_notificacao_id, :data, :olho_direito, :olho_esquerdo, :mao_direita, :mao_esqueda, :pe_direito, :pe_esquerdo, :maior_grau, :escore_omp)
    end
end
