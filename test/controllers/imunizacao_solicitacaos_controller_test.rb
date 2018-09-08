require 'test_helper'

class ImunizacaoSolicitacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imunizacao_solicitacao = imunizacao_solicitacaos(:one)
  end

  test "should get index" do
    get imunizacao_solicitacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_imunizacao_solicitacao_url
    assert_response :success
  end

  test "should create imunizacao_solicitacao" do
    assert_difference('ImunizacaoSolicitacao.count') do
      post imunizacao_solicitacaos_url, params: { imunizacao_solicitacao: { anexo: @imunizacao_solicitacao.anexo, bairro: @imunizacao_solicitacao.bairro, crm_coren: @imunizacao_solicitacao.crm_coren, data_atendimento: @imunizacao_solicitacao.data_atendimento, data_nascimento: @imunizacao_solicitacao.data_nascimento, endereco: @imunizacao_solicitacao.endereco, instituicao_requisitante: @imunizacao_solicitacao.instituicao_requisitante, motivo_solicitacao: @imunizacao_solicitacao.motivo_solicitacao, municipio_atual_id: @imunizacao_solicitacao.municipio_atual_id, municipio_id: @imunizacao_solicitacao.municipio_id, municipio_requisitante_id: @imunizacao_solicitacao.municipio_requisitante_id, nome_mae: @imunizacao_solicitacao.nome_mae, nome_paciente: @imunizacao_solicitacao.nome_paciente, nome_requisitante: @imunizacao_solicitacao.nome_requisitante, observacoes: @imunizacao_solicitacao.observacoes, sexo: @imunizacao_solicitacao.sexo, solicitante: @imunizacao_solicitacao.solicitante, status: @imunizacao_solicitacao.status, telefone_requisitante: @imunizacao_solicitacao.telefone_requisitante, tipo_requisitante: @imunizacao_solicitacao.tipo_requisitante } }
    end

    assert_redirected_to imunizacao_solicitacao_url(ImunizacaoSolicitacao.last)
  end

  test "should show imunizacao_solicitacao" do
    get imunizacao_solicitacao_url(@imunizacao_solicitacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_imunizacao_solicitacao_url(@imunizacao_solicitacao)
    assert_response :success
  end

  test "should update imunizacao_solicitacao" do
    patch imunizacao_solicitacao_url(@imunizacao_solicitacao), params: { imunizacao_solicitacao: { anexo: @imunizacao_solicitacao.anexo, bairro: @imunizacao_solicitacao.bairro, crm_coren: @imunizacao_solicitacao.crm_coren, data_atendimento: @imunizacao_solicitacao.data_atendimento, data_nascimento: @imunizacao_solicitacao.data_nascimento, endereco: @imunizacao_solicitacao.endereco, instituicao_requisitante: @imunizacao_solicitacao.instituicao_requisitante, motivo_solicitacao: @imunizacao_solicitacao.motivo_solicitacao, municipio_atual_id: @imunizacao_solicitacao.municipio_atual_id, municipio_id: @imunizacao_solicitacao.municipio_id, municipio_requisitante_id: @imunizacao_solicitacao.municipio_requisitante_id, nome_mae: @imunizacao_solicitacao.nome_mae, nome_paciente: @imunizacao_solicitacao.nome_paciente, nome_requisitante: @imunizacao_solicitacao.nome_requisitante, observacoes: @imunizacao_solicitacao.observacoes, sexo: @imunizacao_solicitacao.sexo, solicitante: @imunizacao_solicitacao.solicitante, status: @imunizacao_solicitacao.status, telefone_requisitante: @imunizacao_solicitacao.telefone_requisitante, tipo_requisitante: @imunizacao_solicitacao.tipo_requisitante } }
    assert_redirected_to imunizacao_solicitacao_url(@imunizacao_solicitacao)
  end

  test "should destroy imunizacao_solicitacao" do
    assert_difference('ImunizacaoSolicitacao.count', -1) do
      delete imunizacao_solicitacao_url(@imunizacao_solicitacao)
    end

    assert_redirected_to imunizacao_solicitacaos_url
  end
end
