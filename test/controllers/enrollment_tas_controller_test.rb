require 'test_helper'

class EnrollmentTasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment_ta = enrollment_tas(:one)
  end

  test "should get index" do
    get enrollment_tas_url
    assert_response :success
  end

  test "should get new" do
    get new_enrollment_ta_url
    assert_response :success
  end

  test "should create enrollment_ta" do
    assert_difference('EnrollmentTa.count') do
      post enrollment_tas_url, params: { enrollment_ta: { course_id: @enrollment_ta.course_id, user_id: @enrollment_ta.user_id } }
    end

    assert_redirected_to enrollment_ta_url(EnrollmentTa.last)
  end

  test "should show enrollment_ta" do
    get enrollment_ta_url(@enrollment_ta)
    assert_response :success
  end

  test "should get edit" do
    get edit_enrollment_ta_url(@enrollment_ta)
    assert_response :success
  end

  test "should update enrollment_ta" do
    patch enrollment_ta_url(@enrollment_ta), params: { enrollment_ta: { course_id: @enrollment_ta.course_id, user_id: @enrollment_ta.user_id } }
    assert_redirected_to enrollment_ta_url(@enrollment_ta)
  end

  test "should destroy enrollment_ta" do
    assert_difference('EnrollmentTa.count', -1) do
      delete enrollment_ta_url(@enrollment_ta)
    end

    assert_redirected_to enrollment_tas_url
  end
end
