require 'test_helper'

class NotificacaoContatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notificacao_contato = notificacao_contatos(:one)
  end

  test "should get index" do
    get notificacao_contatos_url
    assert_response :success
  end

  test "should get new" do
    get new_notificacao_contato_url
    assert_response :success
  end

  test "should create notificacao_contato" do
    assert_difference('NotificacaoContato.count') do
      post notificacao_contatos_url, params: { notificacao_contato: { confirmado: @notificacao_contato.confirmado, nome: @notificacao_contato.nome, notificacao_id: @notificacao_contato.notificacao_id, suspeito: @notificacao_contato.suspeito, tipo_contato: @notificacao_contato.tipo_contato } }
    end

    assert_redirected_to notificacao_contato_url(NotificacaoContato.last)
  end

  test "should show notificacao_contato" do
    get notificacao_contato_url(@notificacao_contato)
    assert_response :success
  end

  test "should get edit" do
    get edit_notificacao_contato_url(@notificacao_contato)
    assert_response :success
  end

  test "should update notificacao_contato" do
    patch notificacao_contato_url(@notificacao_contato), params: { notificacao_contato: { confirmado: @notificacao_contato.confirmado, nome: @notificacao_contato.nome, notificacao_id: @notificacao_contato.notificacao_id, suspeito: @notificacao_contato.suspeito, tipo_contato: @notificacao_contato.tipo_contato } }
    assert_redirected_to notificacao_contato_url(@notificacao_contato)
  end

  test "should destroy notificacao_contato" do
    assert_difference('NotificacaoContato.count', -1) do
      delete notificacao_contato_url(@notificacao_contato)
    end

    assert_redirected_to notificacao_contatos_url
  end
end
