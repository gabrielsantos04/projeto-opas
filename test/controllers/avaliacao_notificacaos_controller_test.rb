require 'test_helper'

class AvaliacaoNotificacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_notificacao = avaliacao_notificacaos(:one)
  end

  test "should get index" do
    get avaliacao_notificacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_notificacao_url
    assert_response :success
  end

  test "should create avaliacao_notificacao" do
    assert_difference('AvaliacaoNotificacao.count') do
      post avaliacao_notificacaos_url, params: { avaliacao_notificacao: { adaptacoes: @avaliacao_notificacao.adaptacoes, alta_pqt: @avaliacao_notificacao.alta_pqt, atividades_realizadas_ubs: @avaliacao_notificacao.atividades_realizadas_ubs, classificacao_operacional: @avaliacao_notificacao.classificacao_operacional, encaminhamentos: @avaliacao_notificacao.encaminhamentos, grupo_autocuidado: @avaliacao_notificacao.grupo_autocuidado, imobilizacoes: @avaliacao_notificacao.imobilizacoes, inicio_pqt: @avaliacao_notificacao.inicio_pqt, notificacao_id: @avaliacao_notificacao.notificacao_id, observacoes: @avaliacao_notificacao.observacoes, profissao: @avaliacao_notificacao.profissao, unidade_saude: @avaliacao_notificacao.unidade_saude } }
    end

    assert_redirected_to avaliacao_notificacao_url(AvaliacaoNotificacao.last)
  end

  test "should show avaliacao_notificacao" do
    get avaliacao_notificacao_url(@avaliacao_notificacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_notificacao_url(@avaliacao_notificacao)
    assert_response :success
  end

  test "should update avaliacao_notificacao" do
    patch avaliacao_notificacao_url(@avaliacao_notificacao), params: { avaliacao_notificacao: { adaptacoes: @avaliacao_notificacao.adaptacoes, alta_pqt: @avaliacao_notificacao.alta_pqt, atividades_realizadas_ubs: @avaliacao_notificacao.atividades_realizadas_ubs, classificacao_operacional: @avaliacao_notificacao.classificacao_operacional, encaminhamentos: @avaliacao_notificacao.encaminhamentos, grupo_autocuidado: @avaliacao_notificacao.grupo_autocuidado, imobilizacoes: @avaliacao_notificacao.imobilizacoes, inicio_pqt: @avaliacao_notificacao.inicio_pqt, notificacao_id: @avaliacao_notificacao.notificacao_id, observacoes: @avaliacao_notificacao.observacoes, profissao: @avaliacao_notificacao.profissao, unidade_saude: @avaliacao_notificacao.unidade_saude } }
    assert_redirected_to avaliacao_notificacao_url(@avaliacao_notificacao)
  end

  test "should destroy avaliacao_notificacao" do
    assert_difference('AvaliacaoNotificacao.count', -1) do
      delete avaliacao_notificacao_url(@avaliacao_notificacao)
    end

    assert_redirected_to avaliacao_notificacaos_url
  end
end
