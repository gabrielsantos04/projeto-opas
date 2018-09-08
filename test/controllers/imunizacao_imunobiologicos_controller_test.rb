require 'test_helper'

class ImunizacaoImunobiologicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imunizacao_imunobiologico = imunizacao_imunobiologicos(:one)
  end

  test "should get index" do
    get imunizacao_imunobiologicos_url
    assert_response :success
  end

  test "should get new" do
    get new_imunizacao_imunobiologico_url
    assert_response :success
  end

  test "should create imunizacao_imunobiologico" do
    assert_difference('ImunizacaoImunobiologico.count') do
      post imunizacao_imunobiologicos_url, params: { imunizacao_imunobiologico: { imunizacao_solicitacao_id: @imunizacao_imunobiologico.imunizacao_solicitacao_id, imunizacao_vacina_id: @imunizacao_imunobiologico.imunizacao_vacina_id, justificativa_indeferimento: @imunizacao_imunobiologico.justificativa_indeferimento, nome_vacina: @imunizacao_imunobiologico.nome_vacina, status: @imunizacao_imunobiologico.status, tipo: @imunizacao_imunobiologico.tipo } }
    end

    assert_redirected_to imunizacao_imunobiologico_url(ImunizacaoImunobiologico.last)
  end

  test "should show imunizacao_imunobiologico" do
    get imunizacao_imunobiologico_url(@imunizacao_imunobiologico)
    assert_response :success
  end

  test "should get edit" do
    get edit_imunizacao_imunobiologico_url(@imunizacao_imunobiologico)
    assert_response :success
  end

  test "should update imunizacao_imunobiologico" do
    patch imunizacao_imunobiologico_url(@imunizacao_imunobiologico), params: { imunizacao_imunobiologico: { imunizacao_solicitacao_id: @imunizacao_imunobiologico.imunizacao_solicitacao_id, imunizacao_vacina_id: @imunizacao_imunobiologico.imunizacao_vacina_id, justificativa_indeferimento: @imunizacao_imunobiologico.justificativa_indeferimento, nome_vacina: @imunizacao_imunobiologico.nome_vacina, status: @imunizacao_imunobiologico.status, tipo: @imunizacao_imunobiologico.tipo } }
    assert_redirected_to imunizacao_imunobiologico_url(@imunizacao_imunobiologico)
  end

  test "should destroy imunizacao_imunobiologico" do
    assert_difference('ImunizacaoImunobiologico.count', -1) do
      delete imunizacao_imunobiologico_url(@imunizacao_imunobiologico)
    end

    assert_redirected_to imunizacao_imunobiologicos_url
  end
end
