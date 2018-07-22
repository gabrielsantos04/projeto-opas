require 'test_helper'

class DstProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_produto = dst_produtos(:one)
  end

  test "should get index" do
    get dst_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_produto_url
    assert_response :success
  end

  test "should create dst_produto" do
    assert_difference('DstProduto.count') do
      post dst_produtos_url, params: { dst_produto: { descricao: @dst_produto.descricao, nome: @dst_produto.nome, unidade_medida: @dst_produto.unidade_medida } }
    end

    assert_redirected_to dst_produto_url(DstProduto.last)
  end

  test "should show dst_produto" do
    get dst_produto_url(@dst_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_produto_url(@dst_produto)
    assert_response :success
  end

  test "should update dst_produto" do
    patch dst_produto_url(@dst_produto), params: { dst_produto: { descricao: @dst_produto.descricao, nome: @dst_produto.nome, unidade_medida: @dst_produto.unidade_medida } }
    assert_redirected_to dst_produto_url(@dst_produto)
  end

  test "should destroy dst_produto" do
    assert_difference('DstProduto.count', -1) do
      delete dst_produto_url(@dst_produto)
    end

    assert_redirected_to dst_produtos_url
  end
end
