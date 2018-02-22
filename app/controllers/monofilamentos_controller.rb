class MonofilamentosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_monofilamento, only: [:show, :edit, :update, :destroy]

  # GET /monofilamentos
  def index
    @q = Monofilamento.all.ransack(params[:q])
    @monofilamentos = @q.result.page(params[:page])
  end

  # GET /monofilamentos/1
  def show
  end

  # GET /monofilamentos/new
  def new
    @monofilamento = Monofilamento.new
  end

  # GET /monofilamentos/1/edit
  def edit
  end

  # POST /monofilamentos
  def create
    @monofilamento = Monofilamento.new(monofilamento_params)

    if @monofilamento.save
      redirect_to @monofilamento, notice: 'Monofilamento was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /monofilamentos/1
  def update
    if @monofilamento.update(monofilamento_params)
      redirect_to @monofilamento, notice: 'Monofilamento was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /monofilamentos/1
  def destroy
    @monofilamento.destroy
    redirect_to monofilamentos_url, notice: 'Monofilamento was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monofilamento
      @monofilamento = Monofilamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def monofilamento_params
      params.require(:monofilamento).permit(:nome, :cor, :interpretacao)
    end
end
