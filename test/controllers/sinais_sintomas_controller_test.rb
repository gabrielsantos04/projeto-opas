require 'test_helper'

class SinaisSintomasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sinais_sintoma = sinais_sintomas(:one)
  end

  test "should get index" do
    get sinais_sintomas_url
    assert_response :success
  end

  test "should get new" do
    get new_sinais_sintoma_url
    assert_response :success
  end

  test "should create sinais_sintoma" do
    assert_difference('SinaisSintoma.count') do
      post sinais_sintomas_url, params: { sinais_sintoma: { nome: @sinais_sintoma.nome } }
    end

    assert_redirected_to sinais_sintoma_url(SinaisSintoma.last)
  end

  test "should show sinais_sintoma" do
    get sinais_sintoma_url(@sinais_sintoma)
    assert_response :success
  end

  test "should get edit" do
    get edit_sinais_sintoma_url(@sinais_sintoma)
    assert_response :success
  end

  test "should update sinais_sintoma" do
    patch sinais_sintoma_url(@sinais_sintoma), params: { sinais_sintoma: { nome: @sinais_sintoma.nome } }
    assert_redirected_to sinais_sintoma_url(@sinais_sintoma)
  end

  test "should destroy sinais_sintoma" do
    assert_difference('SinaisSintoma.count', -1) do
      delete sinais_sintoma_url(@sinais_sintoma)
    end

    assert_redirected_to sinais_sintomas_url
  end
end
