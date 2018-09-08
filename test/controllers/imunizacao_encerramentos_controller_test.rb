require 'test_helper'

class ImunizacaoEncerramentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imunizacao_encerramento = imunizacao_encerramentos(:one)
  end

  test "should get index" do
    get imunizacao_encerramentos_url
    assert_response :success
  end

  test "should get new" do
    get new_imunizacao_encerramento_url
    assert_response :success
  end

  test "should create imunizacao_encerramento" do
    assert_difference('ImunizacaoEncerramento.count') do
      post imunizacao_encerramentos_url, params: { imunizacao_encerramento: { data_administracao: @imunizacao_encerramento.data_administracao, imunizacao_esquema_id: @imunizacao_encerramento.imunizacao_esquema_id, laboratorio: @imunizacao_encerramento.laboratorio, lote: @imunizacao_encerramento.lote, observacoes: @imunizacao_encerramento.observacoes, profissional: @imunizacao_encerramento.profissional, unidade_administracao: @imunizacao_encerramento.unidade_administracao, validade: @imunizacao_encerramento.validade, via_administracao: @imunizacao_encerramento.via_administracao } }
    end

    assert_redirected_to imunizacao_encerramento_url(ImunizacaoEncerramento.last)
  end

  test "should show imunizacao_encerramento" do
    get imunizacao_encerramento_url(@imunizacao_encerramento)
    assert_response :success
  end

  test "should get edit" do
    get edit_imunizacao_encerramento_url(@imunizacao_encerramento)
    assert_response :success
  end

  test "should update imunizacao_encerramento" do
    patch imunizacao_encerramento_url(@imunizacao_encerramento), params: { imunizacao_encerramento: { data_administracao: @imunizacao_encerramento.data_administracao, imunizacao_esquema_id: @imunizacao_encerramento.imunizacao_esquema_id, laboratorio: @imunizacao_encerramento.laboratorio, lote: @imunizacao_encerramento.lote, observacoes: @imunizacao_encerramento.observacoes, profissional: @imunizacao_encerramento.profissional, unidade_administracao: @imunizacao_encerramento.unidade_administracao, validade: @imunizacao_encerramento.validade, via_administracao: @imunizacao_encerramento.via_administracao } }
    assert_redirected_to imunizacao_encerramento_url(@imunizacao_encerramento)
  end

  test "should destroy imunizacao_encerramento" do
    assert_difference('ImunizacaoEncerramento.count', -1) do
      delete imunizacao_encerramento_url(@imunizacao_encerramento)
    end

    assert_redirected_to imunizacao_encerramentos_url
  end
end
