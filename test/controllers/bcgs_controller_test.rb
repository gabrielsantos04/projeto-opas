require 'test_helper'

class BcgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bcg = bcgs(:one)
  end

  test "should get index" do
    get bcgs_url
    assert_response :success
  end

  test "should get new" do
    get new_bcg_url
    assert_response :success
  end

  test "should create bcg" do
    assert_difference('Bcg.count') do
      post bcgs_url, params: { bcg: { cicatriz: @bcg.cicatriz, notificacao_contato_id: @bcg.notificacao_contato_id, primeira_dose: @bcg.primeira_dose, segunda_dose: @bcg.segunda_dose } }
    end

    assert_redirected_to bcg_url(Bcg.last)
  end

  test "should show bcg" do
    get bcg_url(@bcg)
    assert_response :success
  end

  test "should get edit" do
    get edit_bcg_url(@bcg)
    assert_response :success
  end

  test "should update bcg" do
    patch bcg_url(@bcg), params: { bcg: { cicatriz: @bcg.cicatriz, notificacao_contato_id: @bcg.notificacao_contato_id, primeira_dose: @bcg.primeira_dose, segunda_dose: @bcg.segunda_dose } }
    assert_redirected_to bcg_url(@bcg)
  end

  test "should destroy bcg" do
    assert_difference('Bcg.count', -1) do
      delete bcg_url(@bcg)
    end

    assert_redirected_to bcgs_url
  end
end
