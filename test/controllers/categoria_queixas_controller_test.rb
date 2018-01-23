require 'test_helper'

class CategoriaQueixasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria_queixa = categoria_queixas(:one)
  end

  test "should get index" do
    get categoria_queixas_url
    assert_response :success
  end

  test "should get new" do
    get new_categoria_queixa_url
    assert_response :success
  end

  test "should create categoria_queixa" do
    assert_difference('CategoriaQueixa.count') do
      post categoria_queixas_url, params: { categoria_queixa: { nome: @categoria_queixa.nome } }
    end

    assert_redirected_to categoria_queixa_url(CategoriaQueixa.last)
  end

  test "should show categoria_queixa" do
    get categoria_queixa_url(@categoria_queixa)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoria_queixa_url(@categoria_queixa)
    assert_response :success
  end

  test "should update categoria_queixa" do
    patch categoria_queixa_url(@categoria_queixa), params: { categoria_queixa: { nome: @categoria_queixa.nome } }
    assert_redirected_to categoria_queixa_url(@categoria_queixa)
  end

  test "should destroy categoria_queixa" do
    assert_difference('CategoriaQueixa.count', -1) do
      delete categoria_queixa_url(@categoria_queixa)
    end

    assert_redirected_to categoria_queixas_url
  end
end
