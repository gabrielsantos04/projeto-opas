require 'test_helper'

class DstSolicitacaoProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_solicitacao_produto = dst_solicitacao_produtos(:one)
  end

  test "should get index" do
    get dst_solicitacao_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_solicitacao_produto_url
    assert_response :success
  end

  test "should create dst_solicitacao_produto" do
    assert_difference('DstSolicitacaoProduto.count') do
      post dst_solicitacao_produtos_url, params: { dst_solicitacao_produto: { dst_produto_id: @dst_solicitacao_produto.dst_produto_id, dst_solicitacao_id: @dst_solicitacao_produto.dst_solicitacao_id, quantidade: @dst_solicitacao_produto.quantidade, status: @dst_solicitacao_produto.status } }
    end

    assert_redirected_to dst_solicitacao_produto_url(DstSolicitacaoProduto.last)
  end

  test "should show dst_solicitacao_produto" do
    get dst_solicitacao_produto_url(@dst_solicitacao_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_solicitacao_produto_url(@dst_solicitacao_produto)
    assert_response :success
  end

  test "should update dst_solicitacao_produto" do
    patch dst_solicitacao_produto_url(@dst_solicitacao_produto), params: { dst_solicitacao_produto: { dst_produto_id: @dst_solicitacao_produto.dst_produto_id, dst_solicitacao_id: @dst_solicitacao_produto.dst_solicitacao_id, quantidade: @dst_solicitacao_produto.quantidade, status: @dst_solicitacao_produto.status } }
    assert_redirected_to dst_solicitacao_produto_url(@dst_solicitacao_produto)
  end

  test "should destroy dst_solicitacao_produto" do
    assert_difference('DstSolicitacaoProduto.count', -1) do
      delete dst_solicitacao_produto_url(@dst_solicitacao_produto)
    end

    assert_redirected_to dst_solicitacao_produtos_url
  end
end
