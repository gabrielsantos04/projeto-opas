require 'test_helper'

class EscalaPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escala_part = escala_parts(:one)
  end

  test "should get index" do
    get escala_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_escala_part_url
    assert_response :success
  end

  test "should create escala_part" do
    assert_difference('EscalaPart.count') do
      post escala_parts_url, params: { escala_part: { comentario: @escala_part.comentario, data_entrevista: @escala_part.data_entrevista, entrevistador: @escala_part.entrevistador, grau_restricao: @escala_part.grau_restricao, notificacao_id: @escala_part.notificacao_id, paciente_id: @escala_part.paciente_id, questao_10: @escala_part.questao_10, questao_10_valor: @escala_part.questao_10_valor, questao_11: @escala_part.questao_11, questao_11_valor: @escala_part.questao_11_valor, questao_12: @escala_part.questao_12, questao_12_valor: @escala_part.questao_12_valor, questao_13: @escala_part.questao_13, questao_13_valor: @escala_part.questao_13_valor, questao_14: @escala_part.questao_14, questao_14_valor: @escala_part.questao_14_valor, questao_15: @escala_part.questao_15, questao_15_valor: @escala_part.questao_15_valor, questao_16: @escala_part.questao_16, questao_16_valor: @escala_part.questao_16_valor, questao_17: @escala_part.questao_17, questao_17_valor: @escala_part.questao_17_valor, questao_18: @escala_part.questao_18, questao_18_valor: @escala_part.questao_18_valor, questao_1: @escala_part.questao_1, questao_1_valor: @escala_part.questao_1_valor, questao_2: @escala_part.questao_2, questao_2_valor: @escala_part.questao_2_valor, questao_3: @escala_part.questao_3, questao_3_valor: @escala_part.questao_3_valor, questao_4: @escala_part.questao_4, questao_4_valor: @escala_part.questao_4_valor, questao_5: @escala_part.questao_5, questao_5_valor: @escala_part.questao_5_valor, questao_6: @escala_part.questao_6, questao_6_valor: @escala_part.questao_6_valor, questao_7: @escala_part.questao_7, questao_7_valor: @escala_part.questao_7_valor, questao_8: @escala_part.questao_8, questao_8_valor: @escala_part.questao_8_valor, questao_9: @escala_part.questao_9, questao_9_valor: @escala_part.questao_9_valor, total: @escala_part.total } }
    end

    assert_redirected_to escala_part_url(EscalaPart.last)
  end

  test "should show escala_part" do
    get escala_part_url(@escala_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_escala_part_url(@escala_part)
    assert_response :success
  end

  test "should update escala_part" do
    patch escala_part_url(@escala_part), params: { escala_part: { comentario: @escala_part.comentario, data_entrevista: @escala_part.data_entrevista, entrevistador: @escala_part.entrevistador, grau_restricao: @escala_part.grau_restricao, notificacao_id: @escala_part.notificacao_id, paciente_id: @escala_part.paciente_id, questao_10: @escala_part.questao_10, questao_10_valor: @escala_part.questao_10_valor, questao_11: @escala_part.questao_11, questao_11_valor: @escala_part.questao_11_valor, questao_12: @escala_part.questao_12, questao_12_valor: @escala_part.questao_12_valor, questao_13: @escala_part.questao_13, questao_13_valor: @escala_part.questao_13_valor, questao_14: @escala_part.questao_14, questao_14_valor: @escala_part.questao_14_valor, questao_15: @escala_part.questao_15, questao_15_valor: @escala_part.questao_15_valor, questao_16: @escala_part.questao_16, questao_16_valor: @escala_part.questao_16_valor, questao_17: @escala_part.questao_17, questao_17_valor: @escala_part.questao_17_valor, questao_18: @escala_part.questao_18, questao_18_valor: @escala_part.questao_18_valor, questao_1: @escala_part.questao_1, questao_1_valor: @escala_part.questao_1_valor, questao_2: @escala_part.questao_2, questao_2_valor: @escala_part.questao_2_valor, questao_3: @escala_part.questao_3, questao_3_valor: @escala_part.questao_3_valor, questao_4: @escala_part.questao_4, questao_4_valor: @escala_part.questao_4_valor, questao_5: @escala_part.questao_5, questao_5_valor: @escala_part.questao_5_valor, questao_6: @escala_part.questao_6, questao_6_valor: @escala_part.questao_6_valor, questao_7: @escala_part.questao_7, questao_7_valor: @escala_part.questao_7_valor, questao_8: @escala_part.questao_8, questao_8_valor: @escala_part.questao_8_valor, questao_9: @escala_part.questao_9, questao_9_valor: @escala_part.questao_9_valor, total: @escala_part.total } }
    assert_redirected_to escala_part_url(@escala_part)
  end

  test "should destroy escala_part" do
    assert_difference('EscalaPart.count', -1) do
      delete escala_part_url(@escala_part)
    end

    assert_redirected_to escala_parts_url
  end
end
