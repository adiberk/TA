require 'test_helper'

class EnrollmentTasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment_ta = enrollment_tas(:one)
    User.create(id: 1, first_name: "Nick", last_name: "April", username: "nick", email: "nick@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
    Course.create(id: 2, name: "blank", major_id: 1)
    Course.create(id: 3, name: "b", major_id:2)
    # EnrollmentTa.create(course_id:1, user_id:@enrollment_ta.user_id)
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
      post enrollment_tas_url, params: { enrollment_ta: { course_id: 2, user_id: @enrollment_ta.user_id } }
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
    patch enrollment_ta_url(@enrollment_ta), params: { enrollment_ta: { course_id: 3, user_id: enrollment_tas(:two).user_id} }
    assert_redirected_to enrollment_ta_url(@enrollment_ta)
  end

  test "should destroy enrollment_ta" do
    assert_difference('EnrollmentTa.count', -1) do
      delete enrollment_ta_url(@enrollment_ta)
    end

    assert_redirected_to enrollment_tas_url
  end
end
