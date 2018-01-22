require 'test_helper'

class AvaliacaoNeurologicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_neurologica = avaliacao_neurologicas(:one)
  end

  test "should get index" do
    get avaliacao_neurologicas_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_neurologica_url
    assert_response :success
  end

  test "should create avaliacao_neurologica" do
    assert_difference('AvaliacaoNeurologica.count') do
      post avaliacao_neurologicas_url, params: { avaliacao_neurologica: { avaliacao_notificacao_id: @avaliacao_neurologica.avaliacao_notificacao_id, data: @avaliacao_neurologica.data, direito: @avaliacao_neurologica.direito, esquerdo: @avaliacao_neurologica.esquerdo, queixa_id: @avaliacao_neurologica.queixa_id } }
    end

    assert_redirected_to avaliacao_neurologica_url(AvaliacaoNeurologica.last)
  end

  test "should show avaliacao_neurologica" do
    get avaliacao_neurologica_url(@avaliacao_neurologica)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_neurologica_url(@avaliacao_neurologica)
    assert_response :success
  end

  test "should update avaliacao_neurologica" do
    patch avaliacao_neurologica_url(@avaliacao_neurologica), params: { avaliacao_neurologica: { avaliacao_notificacao_id: @avaliacao_neurologica.avaliacao_notificacao_id, data: @avaliacao_neurologica.data, direito: @avaliacao_neurologica.direito, esquerdo: @avaliacao_neurologica.esquerdo, queixa_id: @avaliacao_neurologica.queixa_id } }
    assert_redirected_to avaliacao_neurologica_url(@avaliacao_neurologica)
  end

  test "should destroy avaliacao_neurologica" do
    assert_difference('AvaliacaoNeurologica.count', -1) do
      delete avaliacao_neurologica_url(@avaliacao_neurologica)
    end

    assert_redirected_to avaliacao_neurologicas_url
  end
end
