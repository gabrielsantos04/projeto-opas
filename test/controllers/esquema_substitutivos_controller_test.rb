require 'test_helper'

class EsquemaSubstitutivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @esquema_substitutivo = esquema_substitutivos(:one)
  end

  test "should get index" do
    get esquema_substitutivos_url
    assert_response :success
  end

  test "should get new" do
    get new_esquema_substitutivo_url
    assert_response :success
  end

  test "should create esquema_substitutivo" do
    assert_difference('EsquemaSubstitutivo.count') do
      post esquema_substitutivos_url, params: { esquema_substitutivo: { medicamento_id: @esquema_substitutivo.medicamento_id, miligramas: @esquema_substitutivo.miligramas, notificacao_id: @esquema_substitutivo.notificacao_id } }
    end

    assert_redirected_to esquema_substitutivo_url(EsquemaSubstitutivo.last)
  end

  test "should show esquema_substitutivo" do
    get esquema_substitutivo_url(@esquema_substitutivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_esquema_substitutivo_url(@esquema_substitutivo)
    assert_response :success
  end

  test "should update esquema_substitutivo" do
    patch esquema_substitutivo_url(@esquema_substitutivo), params: { esquema_substitutivo: { medicamento_id: @esquema_substitutivo.medicamento_id, miligramas: @esquema_substitutivo.miligramas, notificacao_id: @esquema_substitutivo.notificacao_id } }
    assert_redirected_to esquema_substitutivo_url(@esquema_substitutivo)
  end

  test "should destroy esquema_substitutivo" do
    assert_difference('EsquemaSubstitutivo.count', -1) do
      delete esquema_substitutivo_url(@esquema_substitutivo)
    end

    assert_redirected_to esquema_substitutivos_url
  end
end
