require 'test_helper'

class NotificacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notificacao = notificacaos(:one)
  end

  test "should get index" do
    get notificacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_notificacao_url
    assert_response :success
  end

  test "should create notificacao" do
    assert_difference('Notificacao.count') do
      post notificacaos_url, params: { notificacao: { baciloscopia: @notificacao.baciloscopia, data: @notificacao.data, data_inicio: @notificacao.data_inicio, esquema_terapeutico: @notificacao.esquema_terapeutico, grau_incapacidade: @notificacao.grau_incapacidade, modo_deteccao: @notificacao.modo_deteccao, modo_entrada: @notificacao.modo_entrada, numero: @notificacao.numero, observacoes: @notificacao.observacoes } }
    end

    assert_redirected_to notificacao_url(Notificacao.last)
  end

  test "should show notificacao" do
    get notificacao_url(@notificacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_notificacao_url(@notificacao)
    assert_response :success
  end

  test "should update notificacao" do
    patch notificacao_url(@notificacao), params: { notificacao: { baciloscopia: @notificacao.baciloscopia, data: @notificacao.data, data_inicio: @notificacao.data_inicio, esquema_terapeutico: @notificacao.esquema_terapeutico, grau_incapacidade: @notificacao.grau_incapacidade, modo_deteccao: @notificacao.modo_deteccao, modo_entrada: @notificacao.modo_entrada, numero: @notificacao.numero, observacoes: @notificacao.observacoes } }
    assert_redirected_to notificacao_url(@notificacao)
  end

  test "should destroy notificacao" do
    assert_difference('Notificacao.count', -1) do
      delete notificacao_url(@notificacao)
    end

    assert_redirected_to notificacaos_url
  end
end
