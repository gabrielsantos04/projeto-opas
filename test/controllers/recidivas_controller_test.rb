require 'test_helper'

class RecidivasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recidiva = recidivas(:one)
  end

  test "should get index" do
    get recidivas_url
    assert_response :success
  end

  test "should get new" do
    get new_recidiva_url
    assert_response :success
  end

  test "should create recidiva" do
    assert_difference('Recidiva.count') do
      post recidivas_url, params: { recidiva: { baciloscopia: @recidiva.baciloscopia, baciloscopia_alta: @recidiva.baciloscopia_alta, baciloscopia_lb: @recidiva.baciloscopia_lb, baciloscopia_lb_alta: @recidiva.baciloscopia_lb_alta, classificacao_operacional: @recidiva.classificacao_operacional, classificacao_operacional_alta: @recidiva.classificacao_operacional_alta, data_diagnostico: @recidiva.data_diagnostico, data_primeiros_sintomas: @recidiva.data_primeiros_sintomas, doses: @recidiva.doses, esquema_terapeutico: @recidiva.esquema_terapeutico, forma_clinica: @recidiva.forma_clinica, grau_incapacidade: @recidiva.grau_incapacidade, grau_incapacidade_alta: @recidiva.grau_incapacidade_alta, inicio_tratamento: @recidiva.inicio_tratamento, notificacao_id: @recidiva.notificacao_id, prontuario: @recidiva.prontuario, regularidade: @recidiva.regularidade, tempo_alta_cura: @recidiva.tempo_alta_cura, tempo_tratamento: @recidiva.tempo_tratamento, termino_tratamento: @recidiva.termino_tratamento, tratamento_observacoes: @recidiva.tratamento_observacoes, unidade_saude: @recidiva.unidade_saude } }
    end

    assert_redirected_to recidiva_url(Recidiva.last)
  end

  test "should show recidiva" do
    get recidiva_url(@recidiva)
    assert_response :success
  end

  test "should get edit" do
    get edit_recidiva_url(@recidiva)
    assert_response :success
  end

  test "should update recidiva" do
    patch recidiva_url(@recidiva), params: { recidiva: { baciloscopia: @recidiva.baciloscopia, baciloscopia_alta: @recidiva.baciloscopia_alta, baciloscopia_lb: @recidiva.baciloscopia_lb, baciloscopia_lb_alta: @recidiva.baciloscopia_lb_alta, classificacao_operacional: @recidiva.classificacao_operacional, classificacao_operacional_alta: @recidiva.classificacao_operacional_alta, data_diagnostico: @recidiva.data_diagnostico, data_primeiros_sintomas: @recidiva.data_primeiros_sintomas, doses: @recidiva.doses, esquema_terapeutico: @recidiva.esquema_terapeutico, forma_clinica: @recidiva.forma_clinica, grau_incapacidade: @recidiva.grau_incapacidade, grau_incapacidade_alta: @recidiva.grau_incapacidade_alta, inicio_tratamento: @recidiva.inicio_tratamento, notificacao_id: @recidiva.notificacao_id, prontuario: @recidiva.prontuario, regularidade: @recidiva.regularidade, tempo_alta_cura: @recidiva.tempo_alta_cura, tempo_tratamento: @recidiva.tempo_tratamento, termino_tratamento: @recidiva.termino_tratamento, tratamento_observacoes: @recidiva.tratamento_observacoes, unidade_saude: @recidiva.unidade_saude } }
    assert_redirected_to recidiva_url(@recidiva)
  end

  test "should destroy recidiva" do
    assert_difference('Recidiva.count', -1) do
      delete recidiva_url(@recidiva)
    end

    assert_redirected_to recidivas_url
  end
end
