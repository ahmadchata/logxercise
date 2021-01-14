require "test_helper"

class SplashScreenControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get splash_screen_home_url
    assert_response :success
  end
end
