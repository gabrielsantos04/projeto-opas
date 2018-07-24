require 'test_helper'

class DstQuestionariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_questionario = dst_questionarios(:one)
  end

  test "should get index" do
    get dst_questionarios_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_questionario_url
    assert_response :success
  end

  test "should create dst_questionario" do
    assert_difference('DstQuestionario.count') do
      post dst_questionarios_url, params: { dst_questionario: { ativo: @dst_questionario.ativo, descricao: @dst_questionario.descricao, titulo: @dst_questionario.titulo } }
    end

    assert_redirected_to dst_questionario_url(DstQuestionario.last)
  end

  test "should show dst_questionario" do
    get dst_questionario_url(@dst_questionario)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_questionario_url(@dst_questionario)
    assert_response :success
  end

  test "should update dst_questionario" do
    patch dst_questionario_url(@dst_questionario), params: { dst_questionario: { ativo: @dst_questionario.ativo, descricao: @dst_questionario.descricao, titulo: @dst_questionario.titulo } }
    assert_redirected_to dst_questionario_url(@dst_questionario)
  end

  test "should destroy dst_questionario" do
    assert_difference('DstQuestionario.count', -1) do
      delete dst_questionario_url(@dst_questionario)
    end

    assert_redirected_to dst_questionarios_url
  end
end
