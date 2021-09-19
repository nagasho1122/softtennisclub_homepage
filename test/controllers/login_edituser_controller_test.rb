require "test_helper"

class LoginEdituserControllerTest < ActionDispatch::IntegrationTest
  
  test "should get login" do
    get login_path
    assert_response :success
  end
  
  test "login user_name should not valid" do
    get login_path
    assert_template "login_edituser/login"
    post login_path, params:{ login_edituser:  {user_name: " ", 
                      password: "yunsofttennis4559"}}
    assert_template "login_edituser/login"
    assert_not flash.empty?
    get root_url
    assert flash.empty?
  end
  
  test "login password should not valid" do
    get login_path
    assert_template "login_edituser/login"
    post login_path, params: { login_edituser: {user_name: "横国軟式庭球部編集者", 
                      password: "yunsofttenni"} }
    assert_template "login_edituser/login"
    assert_not flash.empty?
    get root_url
    assert flash.empty?
  end
  
  test "login should be valid" do
    get login_path
    assert_template "login_edituser/login"
    post login_path, params: { login_edituser: {user_name: "横国軟式庭球部編集者",
                      password: "yunsofttennis4559"} }
    assert_redirected_to root_url
    follow_redirect!
    assert_not flash.empty?
    get action_path
    assert flash.empty?
  end
  
  test "should logout" do
    get login_path
    assert_template "login_edituser/login"
    post login_path, params: { login_edituser: {user_name: "横国軟式庭球部編集者",
                      password: "yunsofttennis4559"} }
    assert_redirected_to root_url
    delete logout_path
    assert_redirected_to root_url
    follow_redirect!
    assert_not flash.empty?
    assert_select "a[href=?]", login_path
    get action_path
    assert flash.empty?
  end
  
end
