require 'test_helper'

class DermatologicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dermatologica = dermatologicas(:one)
  end

  test "should get index" do
    get dermatologicas_url
    assert_response :success
  end

  test "should get new" do
    get new_dermatologica_url
    assert_response :success
  end

  test "should create dermatologica" do
    assert_difference('Dermatologica.count') do
      post dermatologicas_url, params: { dermatologica: { nome: @dermatologica.nome } }
    end

    assert_redirected_to dermatologica_url(Dermatologica.last)
  end

  test "should show dermatologica" do
    get dermatologica_url(@dermatologica)
    assert_response :success
  end

  test "should get edit" do
    get edit_dermatologica_url(@dermatologica)
    assert_response :success
  end

  test "should update dermatologica" do
    patch dermatologica_url(@dermatologica), params: { dermatologica: { nome: @dermatologica.nome } }
    assert_redirected_to dermatologica_url(@dermatologica)
  end

  test "should destroy dermatologica" do
    assert_difference('Dermatologica.count', -1) do
      delete dermatologica_url(@dermatologica)
    end

    assert_redirected_to dermatologicas_url
  end
end
