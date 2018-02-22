require 'test_helper'

class CondutasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conduta = conduta(:one)
  end

  test "should get index" do
    get conduta_url
    assert_response :success
  end

  test "should get new" do
    get new_conduta_url
    assert_response :success
  end

  test "should create conduta" do
    assert_difference('conduta.count') do
      post conduta_url, params: {condutas: {nome: @conduta.nome } }
    end

    assert_redirected_to conduta_url(Conduta.last)
  end

  test "should show conduta" do
    get conduta_url(@conduta)
    assert_response :success
  end

  test "should get edit" do
    get edit_conduta_url(@conduta)
    assert_response :success
  end

  test "should update conduta" do
    patch conduta_url(@conduta), params: {condutas: {nome: @conduta.nome } }
    assert_redirected_to conduta_url(@conduta)
  end

  test "should destroy conduta" do
    assert_difference('conduta.count', -1) do
      delete conduta_url(@conduta)
    end

    assert_redirected_to conduta_url
  end
end
