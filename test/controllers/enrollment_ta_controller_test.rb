require 'test_helper'

class EnrollmentTaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment_tum = enrollment_ta(:one)
  end

  test "should get index" do
    get enrollment_ta_index_url
    assert_response :success
  end

  test "should get new" do
    get new_enrollment_tum_url
    assert_response :success
  end

  test "should create enrollment_tum" do
    assert_difference('EnrollmentTa.count') do
      post enrollment_ta_index_url, params: { enrollment_tum: { course_id: @enrollment_tum.course_id, user_id: @enrollment_tum.user_id } }
    end

    assert_redirected_to enrollment_tum_url(EnrollmentTa.last)
  end

  test "should show enrollment_tum" do
    get enrollment_tum_url(@enrollment_tum)
    assert_response :success
  end

  test "should get edit" do
    get edit_enrollment_tum_url(@enrollment_tum)
    assert_response :success
  end

  test "should update enrollment_tum" do
    patch enrollment_tum_url(@enrollment_tum), params: { enrollment_tum: { course_id: @enrollment_tum.course_id, user_id: @enrollment_tum.user_id } }
    assert_redirected_to enrollment_tum_url(@enrollment_tum)
  end

  test "should destroy enrollment_tum" do
    assert_difference('EnrollmentTa.count', -1) do
      delete enrollment_tum_url(@enrollment_tum)
    end

    assert_redirected_to enrollment_ta_index_url
  end
end
