require 'test_helper'

class ImunizacaoIndicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imunizacao_indication = imunizacao_indications(:one)
  end

  test "should get index" do
    get imunizacao_indications_url
    assert_response :success
  end

  test "should get new" do
    get new_imunizacao_indication_url
    assert_response :success
  end

  test "should create imunizacao_indication" do
    assert_difference('ImunizacaoIndication.count') do
      post imunizacao_indications_url, params: { imunizacao_indication: {  } }
    end

    assert_redirected_to imunizacao_indication_url(ImunizacaoIndication.last)
  end

  test "should show imunizacao_indication" do
    get imunizacao_indication_url(@imunizacao_indication)
    assert_response :success
  end

  test "should get edit" do
    get edit_imunizacao_indication_url(@imunizacao_indication)
    assert_response :success
  end

  test "should update imunizacao_indication" do
    patch imunizacao_indication_url(@imunizacao_indication), params: { imunizacao_indication: {  } }
    assert_redirected_to imunizacao_indication_url(@imunizacao_indication)
  end

  test "should destroy imunizacao_indication" do
    assert_difference('ImunizacaoIndication.count', -1) do
      delete imunizacao_indication_url(@imunizacao_indication)
    end

    assert_redirected_to imunizacao_indications_url
  end
end
