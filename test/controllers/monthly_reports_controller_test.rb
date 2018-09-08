require 'test_helper'

class MonthlyReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_report = monthly_reports(:one)
  end

  test "should get index" do
    get monthly_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_report_url
    assert_response :success
  end

  test "should create monthly_report" do
    assert_difference('MonthlyReport.count') do
      post monthly_reports_url, params: { monthly_report: { agravo_avc: @monthly_report.agravo_avc, agravo_diabetes: @monthly_report.agravo_diabetes, agravo_hipertensao: @monthly_report.agravo_hipertensao, analfabetos: @monthly_report.analfabetos, atividades_desenvolvidas: @monthly_report.atividades_desenvolvidas, cidade_id: @monthly_report.cidade_id, coordenador: @monthly_report.coordenador, data_proximo: @monthly_report.data_proximo, data_reuniao: @monthly_report.data_reuniao, inicio: @monthly_report.inicio, intercorrencia: @monthly_report.intercorrencia, lider: @monthly_report.lider, local: @monthly_report.local, monitor: @monthly_report.monitor, nome_grupo: @monthly_report.nome_grupo, oficina_sapataria: @monthly_report.oficina_sapataria, outros_agravos: @monthly_report.outros_agravos, qtd_assistente_social: @monthly_report.qtd_assistente_social, qtd_hanseniase: @monthly_report.qtd_hanseniase, qtd_profissionais: @monthly_report.qtd_profissionais, qtd_psicologo: @monthly_report.qtd_psicologo, qtd_sem_hanseniase: @monthly_report.qtd_sem_hanseniase, temas: @monthly_report.temas, termino: @monthly_report.termino } }
    end

    assert_redirected_to monthly_report_url(MonthlyReport.last)
  end

  test "should show monthly_report" do
    get monthly_report_url(@monthly_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_report_url(@monthly_report)
    assert_response :success
  end

  test "should update monthly_report" do
    patch monthly_report_url(@monthly_report), params: { monthly_report: { agravo_avc: @monthly_report.agravo_avc, agravo_diabetes: @monthly_report.agravo_diabetes, agravo_hipertensao: @monthly_report.agravo_hipertensao, analfabetos: @monthly_report.analfabetos, atividades_desenvolvidas: @monthly_report.atividades_desenvolvidas, cidade_id: @monthly_report.cidade_id, coordenador: @monthly_report.coordenador, data_proximo: @monthly_report.data_proximo, data_reuniao: @monthly_report.data_reuniao, inicio: @monthly_report.inicio, intercorrencia: @monthly_report.intercorrencia, lider: @monthly_report.lider, local: @monthly_report.local, monitor: @monthly_report.monitor, nome_grupo: @monthly_report.nome_grupo, oficina_sapataria: @monthly_report.oficina_sapataria, outros_agravos: @monthly_report.outros_agravos, qtd_assistente_social: @monthly_report.qtd_assistente_social, qtd_hanseniase: @monthly_report.qtd_hanseniase, qtd_profissionais: @monthly_report.qtd_profissionais, qtd_psicologo: @monthly_report.qtd_psicologo, qtd_sem_hanseniase: @monthly_report.qtd_sem_hanseniase, temas: @monthly_report.temas, termino: @monthly_report.termino } }
    assert_redirected_to monthly_report_url(@monthly_report)
  end

  test "should destroy monthly_report" do
    assert_difference('MonthlyReport.count', -1) do
      delete monthly_report_url(@monthly_report)
    end

    assert_redirected_to monthly_reports_url
  end
end
