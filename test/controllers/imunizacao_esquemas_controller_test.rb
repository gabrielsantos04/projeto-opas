require 'test_helper'

class ImunizacaoEsquemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imunizacao_esquema = imunizacao_esquemas(:one)
  end

  test "should get index" do
    get imunizacao_esquemas_url
    assert_response :success
  end

  test "should get new" do
    get new_imunizacao_esquema_url
    assert_response :success
  end

  test "should create imunizacao_esquema" do
    assert_difference('ImunizacaoEsquema.count') do
      post imunizacao_esquemas_url, params: { imunizacao_esquema: { dose: @imunizacao_esquema.dose, esquema: @imunizacao_esquema.esquema, imunizacao_imunobiologicos_id: @imunizacao_esquema.imunizacao_imunobiologicos_id, justificativa: @imunizacao_esquema.justificativa, status: @imunizacao_esquema.status } }
    end

    assert_redirected_to imunizacao_esquema_url(ImunizacaoEsquema.last)
  end

  test "should show imunizacao_esquema" do
    get imunizacao_esquema_url(@imunizacao_esquema)
    assert_response :success
  end

  test "should get edit" do
    get edit_imunizacao_esquema_url(@imunizacao_esquema)
    assert_response :success
  end

  test "should update imunizacao_esquema" do
    patch imunizacao_esquema_url(@imunizacao_esquema), params: { imunizacao_esquema: { dose: @imunizacao_esquema.dose, esquema: @imunizacao_esquema.esquema, imunizacao_imunobiologicos_id: @imunizacao_esquema.imunizacao_imunobiologicos_id, justificativa: @imunizacao_esquema.justificativa, status: @imunizacao_esquema.status } }
    assert_redirected_to imunizacao_esquema_url(@imunizacao_esquema)
  end

  test "should destroy imunizacao_esquema" do
    assert_difference('ImunizacaoEsquema.count', -1) do
      delete imunizacao_esquema_url(@imunizacao_esquema)
    end

    assert_redirected_to imunizacao_esquemas_url
  end
end
