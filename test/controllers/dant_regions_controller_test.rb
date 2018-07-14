require 'test_helper'

class DantRegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dant_region = dant_regions(:one)
  end

  test "should get index" do
    get dant_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_dant_region_url
    assert_response :success
  end

  test "should create dant_region" do
    assert_difference('DantRegion.count') do
      post dant_regions_url, params: { dant_region: { nome: @dant_region.nome } }
    end

    assert_redirected_to dant_region_url(DantRegion.last)
  end

  test "should show dant_region" do
    get dant_region_url(@dant_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_dant_region_url(@dant_region)
    assert_response :success
  end

  test "should update dant_region" do
    patch dant_region_url(@dant_region), params: { dant_region: { nome: @dant_region.nome } }
    assert_redirected_to dant_region_url(@dant_region)
  end

  test "should destroy dant_region" do
    assert_difference('DantRegion.count', -1) do
      delete dant_region_url(@dant_region)
    end

    assert_redirected_to dant_regions_url
  end
end
