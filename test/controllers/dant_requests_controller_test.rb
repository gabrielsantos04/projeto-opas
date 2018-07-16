require 'test_helper'

class DantRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dant_request = dant_requests(:one)
  end

  test "should get index" do
    get dant_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_dant_request_url
    assert_response :success
  end

  test "should create dant_request" do
    assert_difference('DantRequest.count') do
      post dant_requests_url, params: { dant_request: { atendimento_diabeticos: @dant_request.atendimento_diabeticos, atendimento_diabeticos_hipertensos: @dant_request.atendimento_diabeticos_hipertensos, atendimento_hipertensos: @dant_request.atendimento_hipertensos, cidade_id: @dant_request.cidade_id, dant_responsavel_program_id: @dant_request.dant_responsavel_program_id, mes: @dant_request.mes, qtd_analoga: @dant_request.qtd_analoga, qtd_atendimento_etilista: @dant_request.qtd_atendimento_etilista, qtd_atendimento_tabagista: @dant_request.qtd_atendimento_tabagista, qtd_diabeticos: @dant_request.qtd_diabeticos, qtd_diabeticos_hipertencos: @dant_request.qtd_diabeticos_hipertencos, qtd_etilista: @dant_request.qtd_etilista, qtd_frascos_analoga: @dant_request.qtd_frascos_analoga, qtd_frascos_nph: @dant_request.qtd_frascos_nph, qtd_frascos_regular: @dant_request.qtd_frascos_regular, qtd_hipertensos: @dant_request.qtd_hipertensos, qtd_nph: @dant_request.qtd_nph, qtd_obesidade_1: @dant_request.qtd_obesidade_1, qtd_obesidade_3: @dant_request.qtd_obesidade_3, qtd_obesidate_2: @dant_request.qtd_obesidate_2, qtd_obesos: @dant_request.qtd_obesos, qtd_obitos_diabeticos: @dant_request.qtd_obitos_diabeticos, qtd_obitos_hipertensos: @dant_request.qtd_obitos_hipertensos, qtd_regular: @dant_request.qtd_regular, qtd_tabagista: @dant_request.qtd_tabagista, qtd_tratamento_hemodialise: @dant_request.qtd_tratamento_hemodialise, status: @dant_request.status } }
    end

    assert_redirected_to dant_request_url(DantRequest.last)
  end

  test "should show dant_request" do
    get dant_request_url(@dant_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_dant_request_url(@dant_request)
    assert_response :success
  end

  test "should update dant_request" do
    patch dant_request_url(@dant_request), params: { dant_request: { atendimento_diabeticos: @dant_request.atendimento_diabeticos, atendimento_diabeticos_hipertensos: @dant_request.atendimento_diabeticos_hipertensos, atendimento_hipertensos: @dant_request.atendimento_hipertensos, cidade_id: @dant_request.cidade_id, dant_responsavel_program_id: @dant_request.dant_responsavel_program_id, mes: @dant_request.mes, qtd_analoga: @dant_request.qtd_analoga, qtd_atendimento_etilista: @dant_request.qtd_atendimento_etilista, qtd_atendimento_tabagista: @dant_request.qtd_atendimento_tabagista, qtd_diabeticos: @dant_request.qtd_diabeticos, qtd_diabeticos_hipertencos: @dant_request.qtd_diabeticos_hipertencos, qtd_etilista: @dant_request.qtd_etilista, qtd_frascos_analoga: @dant_request.qtd_frascos_analoga, qtd_frascos_nph: @dant_request.qtd_frascos_nph, qtd_frascos_regular: @dant_request.qtd_frascos_regular, qtd_hipertensos: @dant_request.qtd_hipertensos, qtd_nph: @dant_request.qtd_nph, qtd_obesidade_1: @dant_request.qtd_obesidade_1, qtd_obesidade_3: @dant_request.qtd_obesidade_3, qtd_obesidate_2: @dant_request.qtd_obesidate_2, qtd_obesos: @dant_request.qtd_obesos, qtd_obitos_diabeticos: @dant_request.qtd_obitos_diabeticos, qtd_obitos_hipertensos: @dant_request.qtd_obitos_hipertensos, qtd_regular: @dant_request.qtd_regular, qtd_tabagista: @dant_request.qtd_tabagista, qtd_tratamento_hemodialise: @dant_request.qtd_tratamento_hemodialise, status: @dant_request.status } }
    assert_redirected_to dant_request_url(@dant_request)
  end

  test "should destroy dant_request" do
    assert_difference('DantRequest.count', -1) do
      delete dant_request_url(@dant_request)
    end

    assert_redirected_to dant_requests_url
  end
end
