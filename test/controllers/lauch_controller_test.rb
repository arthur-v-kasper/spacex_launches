require "test_helper"

class LaunchControllerTest < ActionDispatch::IntegrationTest
  test "should get past" do
    get launch_past_url
    assert_response :success
  end

  test "should get upcoming" do
    get launch_upcoming_url
    assert_response :success
  end

  test "should get latest" do
    get launch_latest_url
    assert_response :success
  end

  test "should get next" do
    get launch_next_url
    assert_response :success
  end
end
