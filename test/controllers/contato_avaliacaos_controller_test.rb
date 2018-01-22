require 'test_helper'

class ContatoAvaliacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contato_avaliacao = contato_avaliacaos(:one)
  end

  test "should get index" do
    get contato_avaliacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_contato_avaliacao_url
    assert_response :success
  end

  test "should create contato_avaliacao" do
    assert_difference('ContatoAvaliacao.count') do
      post contato_avaliacaos_url, params: { contato_avaliacao: { confirmado: @contato_avaliacao.confirmado, data: @contato_avaliacao.data, notificacao_contato_id: @contato_avaliacao.notificacao_contato_id, suspeito: @contato_avaliacao.suspeito } }
    end

    assert_redirected_to contato_avaliacao_url(ContatoAvaliacao.last)
  end

  test "should show contato_avaliacao" do
    get contato_avaliacao_url(@contato_avaliacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_contato_avaliacao_url(@contato_avaliacao)
    assert_response :success
  end

  test "should update contato_avaliacao" do
    patch contato_avaliacao_url(@contato_avaliacao), params: { contato_avaliacao: { confirmado: @contato_avaliacao.confirmado, data: @contato_avaliacao.data, notificacao_contato_id: @contato_avaliacao.notificacao_contato_id, suspeito: @contato_avaliacao.suspeito } }
    assert_redirected_to contato_avaliacao_url(@contato_avaliacao)
  end

  test "should destroy contato_avaliacao" do
    assert_difference('ContatoAvaliacao.count', -1) do
      delete contato_avaliacao_url(@contato_avaliacao)
    end

    assert_redirected_to contato_avaliacaos_url
  end
end
