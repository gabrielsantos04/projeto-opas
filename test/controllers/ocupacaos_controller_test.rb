require 'test_helper'

class OcupacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocupacao = ocupacaos(:one)
  end

  test "should get index" do
    get ocupacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_ocupacao_url
    assert_response :success
  end

  test "should create ocupacao" do
    assert_difference('Ocupacao.count') do
      post ocupacaos_url, params: { ocupacao: { nome: @ocupacao.nome } }
    end

    assert_redirected_to ocupacao_url(Ocupacao.last)
  end

  test "should show ocupacao" do
    get ocupacao_url(@ocupacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_ocupacao_url(@ocupacao)
    assert_response :success
  end

  test "should update ocupacao" do
    patch ocupacao_url(@ocupacao), params: { ocupacao: { nome: @ocupacao.nome } }
    assert_redirected_to ocupacao_url(@ocupacao)
  end

  test "should destroy ocupacao" do
    assert_difference('Ocupacao.count', -1) do
      delete ocupacao_url(@ocupacao)
    end

    assert_redirected_to ocupacaos_url
  end
end
