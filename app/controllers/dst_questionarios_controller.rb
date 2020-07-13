#Classe que controla as açoes da DstQuestionarios
class DstQuestionariosController < ApplicationController
  before_action :set_dst_questionario, only: [:show, :edit, :update, :destroy]

  # GET /dst_questionarios
  def index
    @q = DstQuestionario.all.ransack(params[:q])
    @dst_questionarios = @q.result.page(params[:page])
  end

  # GET /dst_questionarios/1
  def show
  end

  # GET /dst_questionarios/new
  def new
    @dst_questionario = DstQuestionario.new
  end

  # GET /dst_questionarios/1/edit
  def edit
  end

  # POST /dst_questionarios
  def create
    @dst_questionario = DstQuestionario.new(dst_questionario_params)

    if @dst_questionario.save
      redirect_to @dst_questionario, notice: 'Questionário criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /dst_questionarios/1
  def update
    if @dst_questionario.update(dst_questionario_params)
      redirect_to @dst_questionario, notice: 'Questionário atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /dst_questionarios/1
  def destroy
    @dst_questionario.destroy
    redirect_to dst_questionarios_url, notice: 'Questionário excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dst_questionario
      @dst_questionario = DstQuestionario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dst_questionario_params
      params.require(:dst_questionario).permit(:titulo, :descricao, :ativo)
    end
end
