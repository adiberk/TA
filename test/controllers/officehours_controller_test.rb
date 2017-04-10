require 'test_helper'

class OfficehoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @officehour = officehours(:one)
    user  = User.create(id: 1, first_name: "Nick", last_name: "April", username: "nick", email: "nick@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
    user.tacourses.create(id: 3, name: "blank", major_id: 1)
  end

  test "should get index" do
    get officehours_url
    assert_response :success
  end

  test "should get new" do
    get new_officehour_url
    assert_response :success
  end

  test "should create officehour" do
    assert_difference('Officehour.count') do
      post officehours_url, params: { officehour: { course_id: 3, end: @officehour.end, online: @officehour.online, start: @officehour.start, ta_id: @officehour.ta_id } }
    end

    assert_redirected_to officehour_url(Officehour.last)
  end

  test "should show officehour" do
    get officehour_url(@officehour)
    assert_response :success
  end

  test "should get edit" do
    get edit_officehour_url(@officehour)
    assert_response :success
  end

  test "should update officehour" do
    patch officehour_url(@officehour), params: { officehour: { course_id: 3, end: @officehour.end, online: @officehour.online, start: @officehour.start, ta_id: @officehour.ta_id } }
    assert_redirected_to officehour_url(@officehour)
  end

  test "should destroy officehour" do
    assert_difference('Officehour.count', -1) do
      delete officehour_url(@officehour)
    end

    assert_redirected_to officehours_url
  end
end
