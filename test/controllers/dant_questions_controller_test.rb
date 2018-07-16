require 'test_helper'

class DantQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dant_question = dant_questions(:one)
  end

  test "should get index" do
    get dant_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_dant_question_url
    assert_response :success
  end

  test "should create dant_question" do
    assert_difference('DantQuestion.count') do
      post dant_questions_url, params: { dant_question: { pergunta: @dant_question.pergunta, texto: @dant_question.texto } }
    end

    assert_redirected_to dant_question_url(DantQuestion.last)
  end

  test "should show dant_question" do
    get dant_question_url(@dant_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_dant_question_url(@dant_question)
    assert_response :success
  end

  test "should update dant_question" do
    patch dant_question_url(@dant_question), params: { dant_question: { pergunta: @dant_question.pergunta, texto: @dant_question.texto } }
    assert_redirected_to dant_question_url(@dant_question)
  end

  test "should destroy dant_question" do
    assert_difference('DantQuestion.count', -1) do
      delete dant_question_url(@dant_question)
    end

    assert_redirected_to dant_questions_url
  end
end
