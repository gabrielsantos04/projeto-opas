require 'test_helper'

class EscalaSalsasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escala_salsa = escala_salsas(:one)
  end

  test "should get index" do
    get escala_salsas_url
    assert_response :success
  end

  test "should get new" do
    get new_escala_salsa_url
    assert_response :success
  end

  test "should create escala_salsa" do
    assert_difference('EscalaSalsa.count') do
      post escala_salsas_url, params: { escala_salsa: { adaptacoes: @escala_salsa.adaptacoes, condicoes_medicas: @escala_salsa.condicoes_medicas, data_entrevista: @escala_salsa.data_entrevista, entrevistador: @escala_salsa.entrevistador, escore_evito: @escala_salsa.escore_evito, escore_facil: @escala_salsa.escore_facil, escore_fisicamente: @escala_salsa.escore_fisicamente, escore_muito_dificil: @escala_salsa.escore_muito_dificil, escore_nao_preciso: @escala_salsa.escore_nao_preciso, escore_pouco_dificil: @escala_salsa.escore_pouco_dificil, escore_risco: @escala_salsa.escore_risco, escore_salsa: @escala_salsa.escore_salsa, notificacao_id: @escala_salsa.notificacao_id, paciente_id: @escala_salsa.paciente_id, questao_10: @escala_salsa.questao_10, questao_11: @escala_salsa.questao_11, questao_12: @escala_salsa.questao_12, questao_13: @escala_salsa.questao_13, questao_14: @escala_salsa.questao_14, questao_15: @escala_salsa.questao_15, questao_16: @escala_salsa.questao_16, questao_17: @escala_salsa.questao_17, questao_18: @escala_salsa.questao_18, questao_19: @escala_salsa.questao_19, questao_1: @escala_salsa.questao_1, questao_20: @escala_salsa.questao_20, questao_2: @escala_salsa.questao_2, questao_3: @escala_salsa.questao_3, questao_4: @escala_salsa.questao_4, questao_5: @escala_salsa.questao_5, questao_6: @escala_salsa.questao_6, questao_7: @escala_salsa.questao_7, questao_8: @escala_salsa.questao_8, questao_9: @escala_salsa.questao_9, responsavel: @escala_salsa.responsavel } }
    end

    assert_redirected_to escala_salsa_url(EscalaSalsa.last)
  end

  test "should show escala_salsa" do
    get escala_salsa_url(@escala_salsa)
    assert_response :success
  end

  test "should get edit" do
    get edit_escala_salsa_url(@escala_salsa)
    assert_response :success
  end

  test "should update escala_salsa" do
    patch escala_salsa_url(@escala_salsa), params: { escala_salsa: { adaptacoes: @escala_salsa.adaptacoes, condicoes_medicas: @escala_salsa.condicoes_medicas, data_entrevista: @escala_salsa.data_entrevista, entrevistador: @escala_salsa.entrevistador, escore_evito: @escala_salsa.escore_evito, escore_facil: @escala_salsa.escore_facil, escore_fisicamente: @escala_salsa.escore_fisicamente, escore_muito_dificil: @escala_salsa.escore_muito_dificil, escore_nao_preciso: @escala_salsa.escore_nao_preciso, escore_pouco_dificil: @escala_salsa.escore_pouco_dificil, escore_risco: @escala_salsa.escore_risco, escore_salsa: @escala_salsa.escore_salsa, notificacao_id: @escala_salsa.notificacao_id, paciente_id: @escala_salsa.paciente_id, questao_10: @escala_salsa.questao_10, questao_11: @escala_salsa.questao_11, questao_12: @escala_salsa.questao_12, questao_13: @escala_salsa.questao_13, questao_14: @escala_salsa.questao_14, questao_15: @escala_salsa.questao_15, questao_16: @escala_salsa.questao_16, questao_17: @escala_salsa.questao_17, questao_18: @escala_salsa.questao_18, questao_19: @escala_salsa.questao_19, questao_1: @escala_salsa.questao_1, questao_20: @escala_salsa.questao_20, questao_2: @escala_salsa.questao_2, questao_3: @escala_salsa.questao_3, questao_4: @escala_salsa.questao_4, questao_5: @escala_salsa.questao_5, questao_6: @escala_salsa.questao_6, questao_7: @escala_salsa.questao_7, questao_8: @escala_salsa.questao_8, questao_9: @escala_salsa.questao_9, responsavel: @escala_salsa.responsavel } }
    assert_redirected_to escala_salsa_url(@escala_salsa)
  end

  test "should destroy escala_salsa" do
    assert_difference('EscalaSalsa.count', -1) do
      delete escala_salsa_url(@escala_salsa)
    end

    assert_redirected_to escala_salsas_url
  end
end
