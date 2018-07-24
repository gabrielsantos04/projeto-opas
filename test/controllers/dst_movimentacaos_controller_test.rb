require 'test_helper'

class DstMovimentacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_movimentacao = dst_movimentacaos(:one)
  end

  test "should get index" do
    get dst_movimentacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_movimentacao_url
    assert_response :success
  end

  test "should create dst_movimentacao" do
    assert_difference('DstMovimentacao.count') do
      post dst_movimentacaos_url, params: { dst_movimentacao: { categoria: @dst_movimentacao.categoria, descricao: @dst_movimentacao.descricao, dst_local_id: @dst_movimentacao.dst_local_id, dst_lote_id: @dst_movimentacao.dst_lote_id, dst_produto_id: @dst_movimentacao.dst_produto_id, dst_solicitacao_produto_id: @dst_movimentacao.dst_solicitacao_produto_id, quantidade: @dst_movimentacao.quantidade, tipo: @dst_movimentacao.tipo } }
    end

    assert_redirected_to dst_movimentacao_url(DstMovimentacao.last)
  end

  test "should show dst_movimentacao" do
    get dst_movimentacao_url(@dst_movimentacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_movimentacao_url(@dst_movimentacao)
    assert_response :success
  end

  test "should update dst_movimentacao" do
    patch dst_movimentacao_url(@dst_movimentacao), params: { dst_movimentacao: { categoria: @dst_movimentacao.categoria, descricao: @dst_movimentacao.descricao, dst_local_id: @dst_movimentacao.dst_local_id, dst_lote_id: @dst_movimentacao.dst_lote_id, dst_produto_id: @dst_movimentacao.dst_produto_id, dst_solicitacao_produto_id: @dst_movimentacao.dst_solicitacao_produto_id, quantidade: @dst_movimentacao.quantidade, tipo: @dst_movimentacao.tipo } }
    assert_redirected_to dst_movimentacao_url(@dst_movimentacao)
  end

  test "should destroy dst_movimentacao" do
    assert_difference('DstMovimentacao.count', -1) do
      delete dst_movimentacao_url(@dst_movimentacao)
    end

    assert_redirected_to dst_movimentacaos_url
  end
end
