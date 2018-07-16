class DantQuestionsController < ApplicationController
  before_action :set_dant_question, only: [:show, :edit, :update, :destroy]

  # GET /dant_questions
  def index
    @q = DantQuestion.all.ransack(params[:q])
    @dant_questions = @q.result.page(params[:page])
  end

  # GET /dant_questions/1
  def show
  end

  # GET /dant_questions/new
  def new
    @dant_question = DantQuestion.new
  end

  # GET /dant_questions/1/edit
  def edit
  end

  # POST /dant_questions
  def create
    @dant_question = DantQuestion.new(dant_question_params)

    if @dant_question.save
      redirect_to @dant_question, notice: 'Dant question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dant_questions/1
  def update
    if @dant_question.update(dant_question_params)
      redirect_to @dant_question, notice: 'Dant question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dant_questions/1
  def destroy
    @dant_question.destroy
    redirect_to dant_questions_url, notice: 'Dant question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dant_question
      @dant_question = DantQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dant_question_params
      params.require(:dant_question).permit(:pergunta, :texto)
    end
end
