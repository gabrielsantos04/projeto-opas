class BcgsController < ApplicationController
  before_action :set_bcg, only: [:show, :edit, :update, :destroy]

  # GET /bcgs
  def index
    @q = Bcg.all.ransack(params[:q])
    @bcgs = @q.result.page(params[:page])
  end

  # GET /bcgs/1
  def show
  end

  # GET /bcgs/new
  def new
    @bcg = Bcg.new
  end

  # GET /bcgs/1/edit
  def edit
  end

  # POST /bcgs
  def create
    @bcg = Bcg.new(bcg_params)

    if @bcg.save
      redirect_to @bcg, notice: 'Bcg was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bcgs/1
  def update
    if @bcg.update(bcg_params)
      redirect_to @bcg, notice: 'Bcg was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bcgs/1
  def destroy
    @bcg.destroy
    redirect_to bcgs_url, notice: 'Bcg was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bcg
      @bcg = Bcg.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bcg_params
      params.require(:bcg).permit(:primeira_dose, :segunda_dose, :cicatriz, :notificacao_contato_id)
    end
end
