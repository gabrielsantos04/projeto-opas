require 'test_helper'

class DstLotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_lote = dst_lotes(:one)
  end

  test "should get index" do
    get dst_lotes_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_lote_url
    assert_response :success
  end

  test "should create dst_lote" do
    assert_difference('DstLote.count') do
      post dst_lotes_url, params: { dst_lote: { descricao: @dst_lote.descricao, dst_produto_id: @dst_lote.dst_produto_id, nome: @dst_lote.nome, validade: @dst_lote.validade } }
    end

    assert_redirected_to dst_lote_url(DstLote.last)
  end

  test "should show dst_lote" do
    get dst_lote_url(@dst_lote)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_lote_url(@dst_lote)
    assert_response :success
  end

  test "should update dst_lote" do
    patch dst_lote_url(@dst_lote), params: { dst_lote: { descricao: @dst_lote.descricao, dst_produto_id: @dst_lote.dst_produto_id, nome: @dst_lote.nome, validade: @dst_lote.validade } }
    assert_redirected_to dst_lote_url(@dst_lote)
  end

  test "should destroy dst_lote" do
    assert_difference('DstLote.count', -1) do
      delete dst_lote_url(@dst_lote)
    end

    assert_redirected_to dst_lotes_url
  end
end
