require 'test_helper'

class DadosClinicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dados_clinico = dados_clinicos(:one)
  end

  test "should get index" do
    get dados_clinicos_url
    assert_response :success
  end

  test "should get new" do
    get new_dados_clinico_url
    assert_response :success
  end

  test "should create dados_clinico" do
    assert_difference('DadosClinico.count') do
      post dados_clinicos_url, params: { dados_clinico: { classificacao_operacional: @dados_clinico.classificacao_operacional, forma_clinica: @dados_clinico.forma_clinica, lesoes_cultaneas: @dados_clinico.lesoes_cultaneas, nervos_afetados: @dados_clinico.nervos_afetados, notificacao_id: @dados_clinico.notificacao_id } }
    end

    assert_redirected_to dados_clinico_url(DadosClinico.last)
  end

  test "should show dados_clinico" do
    get dados_clinico_url(@dados_clinico)
    assert_response :success
  end

  test "should get edit" do
    get edit_dados_clinico_url(@dados_clinico)
    assert_response :success
  end

  test "should update dados_clinico" do
    patch dados_clinico_url(@dados_clinico), params: { dados_clinico: { classificacao_operacional: @dados_clinico.classificacao_operacional, forma_clinica: @dados_clinico.forma_clinica, lesoes_cultaneas: @dados_clinico.lesoes_cultaneas, nervos_afetados: @dados_clinico.nervos_afetados, notificacao_id: @dados_clinico.notificacao_id } }
    assert_redirected_to dados_clinico_url(@dados_clinico)
  end

  test "should destroy dados_clinico" do
    assert_difference('DadosClinico.count', -1) do
      delete dados_clinico_url(@dados_clinico)
    end

    assert_redirected_to dados_clinicos_url
  end
end
