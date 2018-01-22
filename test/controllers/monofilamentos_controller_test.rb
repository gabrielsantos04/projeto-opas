require 'test_helper'

class MonofilamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monofilamento = monofilamentos(:one)
  end

  test "should get index" do
    get monofilamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_monofilamento_url
    assert_response :success
  end

  test "should create monofilamento" do
    assert_difference('Monofilamento.count') do
      post monofilamentos_url, params: { monofilamento: { cor: @monofilamento.cor, interpretacao: @monofilamento.interpretacao, nome: @monofilamento.nome } }
    end

    assert_redirected_to monofilamento_url(Monofilamento.last)
  end

  test "should show monofilamento" do
    get monofilamento_url(@monofilamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_monofilamento_url(@monofilamento)
    assert_response :success
  end

  test "should update monofilamento" do
    patch monofilamento_url(@monofilamento), params: { monofilamento: { cor: @monofilamento.cor, interpretacao: @monofilamento.interpretacao, nome: @monofilamento.nome } }
    assert_redirected_to monofilamento_url(@monofilamento)
  end

  test "should destroy monofilamento" do
    assert_difference('Monofilamento.count', -1) do
      delete monofilamento_url(@monofilamento)
    end

    assert_redirected_to monofilamentos_url
  end
end
