require 'test_helper'

class Icd10sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icd10 = icd10s(:one)
  end

  test "should get index" do
    get icd10s_url
    assert_response :success
  end

  test "should get new" do
    get new_icd10_url
    assert_response :success
  end

  test "should create icd10" do
    assert_difference('Icd10.count') do
      post icd10s_url, params: { icd10: {  } }
    end

    assert_redirected_to icd10_url(Icd10.last)
  end

  test "should show icd10" do
    get icd10_url(@icd10)
    assert_response :success
  end

  test "should get edit" do
    get edit_icd10_url(@icd10)
    assert_response :success
  end

  test "should update icd10" do
    patch icd10_url(@icd10), params: { icd10: {  } }
    assert_redirected_to icd10_url(@icd10)
  end

  test "should destroy icd10" do
    assert_difference('Icd10.count', -1) do
      delete icd10_url(@icd10)
    end

    assert_redirected_to icd10s_url
  end
end
