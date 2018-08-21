require 'test_helper'

class ImunizacaoVacinasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imunizacao_vacina = imunizacao_vacinas(:one)
  end

  test "should get index" do
    get imunizacao_vacinas_url
    assert_response :success
  end

  test "should get new" do
    get new_imunizacao_vacina_url
    assert_response :success
  end

  test "should create imunizacao_vacina" do
    assert_difference('ImunizacaoVacina.count') do
      post imunizacao_vacinas_url, params: { imunizacao_vacina: { descricao: @imunizacao_vacina.descricao, nome: @imunizacao_vacina.nome } }
    end

    assert_redirected_to imunizacao_vacina_url(ImunizacaoVacina.last)
  end

  test "should show imunizacao_vacina" do
    get imunizacao_vacina_url(@imunizacao_vacina)
    assert_response :success
  end

  test "should get edit" do
    get edit_imunizacao_vacina_url(@imunizacao_vacina)
    assert_response :success
  end

  test "should update imunizacao_vacina" do
    patch imunizacao_vacina_url(@imunizacao_vacina), params: { imunizacao_vacina: { descricao: @imunizacao_vacina.descricao, nome: @imunizacao_vacina.nome } }
    assert_redirected_to imunizacao_vacina_url(@imunizacao_vacina)
  end

  test "should destroy imunizacao_vacina" do
    assert_difference('ImunizacaoVacina.count', -1) do
      delete imunizacao_vacina_url(@imunizacao_vacina)
    end

    assert_redirected_to imunizacao_vacinas_url
  end
end
