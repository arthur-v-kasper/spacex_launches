require "test_helper"

class LauchControllerTest < ActionDispatch::IntegrationTest
  test "should get past" do
    get lauch_past_url
    assert_response :success
  end

  test "should get upcoming" do
    get lauch_upcoming_url
    assert_response :success
  end

  test "should get latest" do
    get lauch_latest_url
    assert_response :success
  end

  test "should get next" do
    get lauch_next_url
    assert_response :success
  end
end
