require 'test_helper'

class ClassificacaoGrausControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classificacao_grau = classificacao_graus(:one)
  end

  test "should get index" do
    get classificacao_graus_url
    assert_response :success
  end

  test "should get new" do
    get new_classificacao_grau_url
    assert_response :success
  end

  test "should create classificacao_grau" do
    assert_difference('ClassificacaoGrau.count') do
      post classificacao_graus_url, params: { classificacao_grau: { avaliacao_notificacao_id: @classificacao_grau.avaliacao_notificacao_id, data: @classificacao_grau.data, escore_omp: @classificacao_grau.escore_omp, maior_grau: @classificacao_grau.maior_grau, mao_direita: @classificacao_grau.mao_direita, mao_esqueda: @classificacao_grau.mao_esqueda, olho_direito: @classificacao_grau.olho_direito, olho_esquerdo: @classificacao_grau.olho_esquerdo, pe_direito: @classificacao_grau.pe_direito, pe_esquerdo: @classificacao_grau.pe_esquerdo } }
    end

    assert_redirected_to classificacao_grau_url(ClassificacaoGrau.last)
  end

  test "should show classificacao_grau" do
    get classificacao_grau_url(@classificacao_grau)
    assert_response :success
  end

  test "should get edit" do
    get edit_classificacao_grau_url(@classificacao_grau)
    assert_response :success
  end

  test "should update classificacao_grau" do
    patch classificacao_grau_url(@classificacao_grau), params: { classificacao_grau: { avaliacao_notificacao_id: @classificacao_grau.avaliacao_notificacao_id, data: @classificacao_grau.data, escore_omp: @classificacao_grau.escore_omp, maior_grau: @classificacao_grau.maior_grau, mao_direita: @classificacao_grau.mao_direita, mao_esqueda: @classificacao_grau.mao_esqueda, olho_direito: @classificacao_grau.olho_direito, olho_esquerdo: @classificacao_grau.olho_esquerdo, pe_direito: @classificacao_grau.pe_direito, pe_esquerdo: @classificacao_grau.pe_esquerdo } }
    assert_redirected_to classificacao_grau_url(@classificacao_grau)
  end

  test "should destroy classificacao_grau" do
    assert_difference('ClassificacaoGrau.count', -1) do
      delete classificacao_grau_url(@classificacao_grau)
    end

    assert_redirected_to classificacao_graus_url
  end
end
