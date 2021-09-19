require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get action" do
    get action_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end
end
