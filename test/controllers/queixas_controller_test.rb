require 'test_helper'

class QueixasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @queixa = queixas(:one)
  end

  test "should get index" do
    get queixas_url
    assert_response :success
  end

  test "should get new" do
    get new_queixa_url
    assert_response :success
  end

  test "should create queixa" do
    assert_difference('Queixa.count') do
      post queixas_url, params: { queixa: { categoria: @queixa.categoria, nome: @queixa.nome } }
    end

    assert_redirected_to queixa_url(Queixa.last)
  end

  test "should show queixa" do
    get queixa_url(@queixa)
    assert_response :success
  end

  test "should get edit" do
    get edit_queixa_url(@queixa)
    assert_response :success
  end

  test "should update queixa" do
    patch queixa_url(@queixa), params: { queixa: { categoria: @queixa.categoria, nome: @queixa.nome } }
    assert_redirected_to queixa_url(@queixa)
  end

  test "should destroy queixa" do
    assert_difference('Queixa.count', -1) do
      delete queixa_url(@queixa)
    end

    assert_redirected_to queixas_url
  end
end
