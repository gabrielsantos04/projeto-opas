require 'test_helper'

class DantResponsavelProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dant_responsavel_program = dant_responsavel_programs(:one)
  end

  test "should get index" do
    get dant_responsavel_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_dant_responsavel_program_url
    assert_response :success
  end

  test "should create dant_responsavel_program" do
    assert_difference('DantResponsavelProgram.count') do
      post dant_responsavel_programs_url, params: { dant_responsavel_program: { cargo: @dant_responsavel_program.cargo, cidade_id: @dant_responsavel_program.cidade_id, nome: @dant_responsavel_program.nome } }
    end

    assert_redirected_to dant_responsavel_program_url(DantResponsavelProgram.last)
  end

  test "should show dant_responsavel_program" do
    get dant_responsavel_program_url(@dant_responsavel_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_dant_responsavel_program_url(@dant_responsavel_program)
    assert_response :success
  end

  test "should update dant_responsavel_program" do
    patch dant_responsavel_program_url(@dant_responsavel_program), params: { dant_responsavel_program: { cargo: @dant_responsavel_program.cargo, cidade_id: @dant_responsavel_program.cidade_id, nome: @dant_responsavel_program.nome } }
    assert_redirected_to dant_responsavel_program_url(@dant_responsavel_program)
  end

  test "should destroy dant_responsavel_program" do
    assert_difference('DantResponsavelProgram.count', -1) do
      delete dant_responsavel_program_url(@dant_responsavel_program)
    end

    assert_redirected_to dant_responsavel_programs_url
  end
end
