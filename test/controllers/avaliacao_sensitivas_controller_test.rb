require 'test_helper'

class AvaliacaoSensitivasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_sensitiva = avaliacao_sensitivas(:one)
  end

  test "should get index" do
    get avaliacao_sensitivas_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_sensitiva_url
    assert_response :success
  end

  test "should create avaliacao_sensitiva" do
    assert_difference('AvaliacaoSensitiva.count') do
      post avaliacao_sensitivas_url, params: { avaliacao_sensitiva: { avaliacao_notificacao_id: @avaliacao_sensitiva.avaliacao_notificacao_id, data: @avaliacao_sensitiva.data, dedao_direito: @avaliacao_sensitiva.dedao_direito, dedao_esquerdo: @avaliacao_sensitiva.dedao_esquerdo, indicador_d: @avaliacao_sensitiva.indicador_d, indicador_d_ponta: @avaliacao_sensitiva.indicador_d_ponta, indicador_e: @avaliacao_sensitiva.indicador_e, indicador_e_ponta: @avaliacao_sensitiva.indicador_e_ponta, mao_d_costa: @avaliacao_sensitiva.mao_d_costa, mao_direita: @avaliacao_sensitiva.mao_direita, mao_e_costa: @avaliacao_sensitiva.mao_e_costa, mao_esquerda: @avaliacao_sensitiva.mao_esquerda, mindinho_d: @avaliacao_sensitiva.mindinho_d, mindinho_d_ponta: @avaliacao_sensitiva.mindinho_d_ponta, mindinho_e: @avaliacao_sensitiva.mindinho_e, mindinho_e_ponta: @avaliacao_sensitiva.mindinho_e_ponta, pe_d_1: @avaliacao_sensitiva.pe_d_1, pe_d_1_ponta: @avaliacao_sensitiva.pe_d_1_ponta, pe_d_3: @avaliacao_sensitiva.pe_d_3, pe_d_3_ponta: @avaliacao_sensitiva.pe_d_3_ponta, pe_d_5: @avaliacao_sensitiva.pe_d_5, pe_d_5_ponta: @avaliacao_sensitiva.pe_d_5_ponta, pe_d_calcanhar: @avaliacao_sensitiva.pe_d_calcanhar, pe_d_e1: @avaliacao_sensitiva.pe_d_e1, pe_d_e1: @avaliacao_sensitiva.pe_d_e1, pe_direito: @avaliacao_sensitiva.pe_direito, pe_e_1: @avaliacao_sensitiva.pe_e_1, pe_e_1_ponta: @avaliacao_sensitiva.pe_e_1_ponta, pe_e_3: @avaliacao_sensitiva.pe_e_3, pe_e_3_ponta: @avaliacao_sensitiva.pe_e_3_ponta, pe_e_5: @avaliacao_sensitiva.pe_e_5, pe_e_5_ponta: @avaliacao_sensitiva.pe_e_5_ponta, pe_e_calcanhar: @avaliacao_sensitiva.pe_e_calcanhar, pe_e_e1: @avaliacao_sensitiva.pe_e_e1, pe_e_e2: @avaliacao_sensitiva.pe_e_e2, pe_esquerdo: @avaliacao_sensitiva.pe_esquerdo } }
    end

    assert_redirected_to avaliacao_sensitiva_url(AvaliacaoSensitiva.last)
  end

  test "should show avaliacao_sensitiva" do
    get avaliacao_sensitiva_url(@avaliacao_sensitiva)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_sensitiva_url(@avaliacao_sensitiva)
    assert_response :success
  end

  test "should update avaliacao_sensitiva" do
    patch avaliacao_sensitiva_url(@avaliacao_sensitiva), params: { avaliacao_sensitiva: { avaliacao_notificacao_id: @avaliacao_sensitiva.avaliacao_notificacao_id, data: @avaliacao_sensitiva.data, dedao_direito: @avaliacao_sensitiva.dedao_direito, dedao_esquerdo: @avaliacao_sensitiva.dedao_esquerdo, indicador_d: @avaliacao_sensitiva.indicador_d, indicador_d_ponta: @avaliacao_sensitiva.indicador_d_ponta, indicador_e: @avaliacao_sensitiva.indicador_e, indicador_e_ponta: @avaliacao_sensitiva.indicador_e_ponta, mao_d_costa: @avaliacao_sensitiva.mao_d_costa, mao_direita: @avaliacao_sensitiva.mao_direita, mao_e_costa: @avaliacao_sensitiva.mao_e_costa, mao_esquerda: @avaliacao_sensitiva.mao_esquerda, mindinho_d: @avaliacao_sensitiva.mindinho_d, mindinho_d_ponta: @avaliacao_sensitiva.mindinho_d_ponta, mindinho_e: @avaliacao_sensitiva.mindinho_e, mindinho_e_ponta: @avaliacao_sensitiva.mindinho_e_ponta, pe_d_1: @avaliacao_sensitiva.pe_d_1, pe_d_1_ponta: @avaliacao_sensitiva.pe_d_1_ponta, pe_d_3: @avaliacao_sensitiva.pe_d_3, pe_d_3_ponta: @avaliacao_sensitiva.pe_d_3_ponta, pe_d_5: @avaliacao_sensitiva.pe_d_5, pe_d_5_ponta: @avaliacao_sensitiva.pe_d_5_ponta, pe_d_calcanhar: @avaliacao_sensitiva.pe_d_calcanhar, pe_d_e1: @avaliacao_sensitiva.pe_d_e1, pe_d_e1: @avaliacao_sensitiva.pe_d_e1, pe_direito: @avaliacao_sensitiva.pe_direito, pe_e_1: @avaliacao_sensitiva.pe_e_1, pe_e_1_ponta: @avaliacao_sensitiva.pe_e_1_ponta, pe_e_3: @avaliacao_sensitiva.pe_e_3, pe_e_3_ponta: @avaliacao_sensitiva.pe_e_3_ponta, pe_e_5: @avaliacao_sensitiva.pe_e_5, pe_e_5_ponta: @avaliacao_sensitiva.pe_e_5_ponta, pe_e_calcanhar: @avaliacao_sensitiva.pe_e_calcanhar, pe_e_e1: @avaliacao_sensitiva.pe_e_e1, pe_e_e2: @avaliacao_sensitiva.pe_e_e2, pe_esquerdo: @avaliacao_sensitiva.pe_esquerdo } }
    assert_redirected_to avaliacao_sensitiva_url(@avaliacao_sensitiva)
  end

  test "should destroy avaliacao_sensitiva" do
    assert_difference('AvaliacaoSensitiva.count', -1) do
      delete avaliacao_sensitiva_url(@avaliacao_sensitiva)
    end

    assert_redirected_to avaliacao_sensitivas_url
  end
end
