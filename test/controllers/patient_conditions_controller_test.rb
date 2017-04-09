require 'test_helper'

class PatientConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_condition = patient_conditions(:one)
  end

  test "should get index" do
    get patient_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_condition_url
    assert_response :success
  end

  test "should create patient_condition" do
    assert_difference('PatientCondition.count') do
      post patient_conditions_url, params: { patient_condition: { condition_id: @patient_condition.condition_id, cured: @patient_condition.cured, doctor_id: @patient_condition.doctor_id, notes: @patient_condition.notes, patient_id: @patient_condition.patient_id, reported: @patient_condition.reported } }
    end

    assert_redirected_to patient_condition_url(PatientCondition.last)
  end

  test "should show patient_condition" do
    get patient_condition_url(@patient_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_condition_url(@patient_condition)
    assert_response :success
  end

  test "should update patient_condition" do
    patch patient_condition_url(@patient_condition), params: { patient_condition: { condition_id: @patient_condition.condition_id, cured: @patient_condition.cured, doctor_id: @patient_condition.doctor_id, notes: @patient_condition.notes, patient_id: @patient_condition.patient_id, reported: @patient_condition.reported } }
    assert_redirected_to patient_condition_url(@patient_condition)
  end

  test "should destroy patient_condition" do
    assert_difference('PatientCondition.count', -1) do
      delete patient_condition_url(@patient_condition)
    end

    assert_redirected_to patient_conditions_url
  end
end
