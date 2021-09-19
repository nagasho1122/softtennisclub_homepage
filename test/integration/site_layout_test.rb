require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
 
 test "layout links" do
   get root_path
   assert_template "static_pages/home"
   assert_select "a[href=?]", root_path
   assert_select "a[href=?]", action_path
   assert_select "a[href=?]", members_path
   assert_select "a[href=?]", results_path
   assert_select "a[href=?]", contact_path
   assert_select "a[href=?]", login_path
 end
 
end
