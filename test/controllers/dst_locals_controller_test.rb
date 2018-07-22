require 'test_helper'

class DstLocalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dst_local = dst_locals(:one)
  end

  test "should get index" do
    get dst_locals_url
    assert_response :success
  end

  test "should get new" do
    get new_dst_local_url
    assert_response :success
  end

  test "should create dst_local" do
    assert_difference('DstLocal.count') do
      post dst_locals_url, params: { dst_local: { categoria: @dst_local.categoria, cidade_id: @dst_local.cidade_id, descricao: @dst_local.descricao, nome: @dst_local.nome } }
    end

    assert_redirected_to dst_local_url(DstLocal.last)
  end

  test "should show dst_local" do
    get dst_local_url(@dst_local)
    assert_response :success
  end

  test "should get edit" do
    get edit_dst_local_url(@dst_local)
    assert_response :success
  end

  test "should update dst_local" do
    patch dst_local_url(@dst_local), params: { dst_local: { categoria: @dst_local.categoria, cidade_id: @dst_local.cidade_id, descricao: @dst_local.descricao, nome: @dst_local.nome } }
    assert_redirected_to dst_local_url(@dst_local)
  end

  test "should destroy dst_local" do
    assert_difference('DstLocal.count', -1) do
      delete dst_local_url(@dst_local)
    end

    assert_redirected_to dst_locals_url
  end
end
