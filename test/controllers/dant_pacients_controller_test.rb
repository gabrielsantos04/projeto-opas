require 'test_helper'

class DantPacientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dant_pacient = dant_pacients(:one)
  end

  test "should get index" do
    get dant_pacients_url
    assert_response :success
  end

  test "should get new" do
    get new_dant_pacient_url
    assert_response :success
  end

  test "should create dant_pacient" do
    assert_difference('DantPacient.count') do
      post dant_pacients_url, params: { dant_pacient: { cidade_id: @dant_pacient.cidade_id, cpf: @dant_pacient.cpf, diabetico: @dant_pacient.diabetico, endereco: @dant_pacient.endereco, etilista: @dant_pacient.etilista, frascos_diarios: @dant_pacient.frascos_diarios, frascos_mensais: @dant_pacient.frascos_mensais, grau_obesidade: @dant_pacient.grau_obesidade, hipertenso: @dant_pacient.hipertenso, idade: @dant_pacient.idade, nome: @dant_pacient.nome, obeso: @dant_pacient.obeso, rg: @dant_pacient.rg, sexo: @dant_pacient.sexo, tabagista: @dant_pacient.tabagista, tipo_insulina: @dant_pacient.tipo_insulina } }
    end

    assert_redirected_to dant_pacient_url(DantPacient.last)
  end

  test "should show dant_pacient" do
    get dant_pacient_url(@dant_pacient)
    assert_response :success
  end

  test "should get edit" do
    get edit_dant_pacient_url(@dant_pacient)
    assert_response :success
  end

  test "should update dant_pacient" do
    patch dant_pacient_url(@dant_pacient), params: { dant_pacient: { cidade_id: @dant_pacient.cidade_id, cpf: @dant_pacient.cpf, diabetico: @dant_pacient.diabetico, endereco: @dant_pacient.endereco, etilista: @dant_pacient.etilista, frascos_diarios: @dant_pacient.frascos_diarios, frascos_mensais: @dant_pacient.frascos_mensais, grau_obesidade: @dant_pacient.grau_obesidade, hipertenso: @dant_pacient.hipertenso, idade: @dant_pacient.idade, nome: @dant_pacient.nome, obeso: @dant_pacient.obeso, rg: @dant_pacient.rg, sexo: @dant_pacient.sexo, tabagista: @dant_pacient.tabagista, tipo_insulina: @dant_pacient.tipo_insulina } }
    assert_redirected_to dant_pacient_url(@dant_pacient)
  end

  test "should destroy dant_pacient" do
    assert_difference('DantPacient.count', -1) do
      delete dant_pacient_url(@dant_pacient)
    end

    assert_redirected_to dant_pacients_url
  end
end
