require 'test_helper'

class DstSolicitacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_solicitacao = dst_solicitacaos(:one)
  end

  test "should get index" do
    get dst_solicitacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_solicitacao_url
    assert_response :success
  end

  test "should create dst_solicitacao" do
    assert_difference('DstSolicitacao.count') do
      post dst_solicitacaos_url, params: { dst_solicitacao: { dst_local_id: @dst_solicitacao.dst_local_id, observacoes: @dst_solicitacao.observacoes, status: @dst_solicitacao.status, user_id: @dst_solicitacao.user_id } }
    end

    assert_redirected_to dst_solicitacao_url(DstSolicitacao.last)
  end

  test "should show dst_solicitacao" do
    get dst_solicitacao_url(@dst_solicitacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_solicitacao_url(@dst_solicitacao)
    assert_response :success
  end

  test "should update dst_solicitacao" do
    patch dst_solicitacao_url(@dst_solicitacao), params: { dst_solicitacao: { dst_local_id: @dst_solicitacao.dst_local_id, observacoes: @dst_solicitacao.observacoes, status: @dst_solicitacao.status, user_id: @dst_solicitacao.user_id } }
    assert_redirected_to dst_solicitacao_url(@dst_solicitacao)
  end

  test "should destroy dst_solicitacao" do
    assert_difference('DstSolicitacao.count', -1) do
      delete dst_solicitacao_url(@dst_solicitacao)
    end

    assert_redirected_to dst_solicitacaos_url
  end
end
