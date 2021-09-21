require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    image = Rack::Test::UploadedFile.new("test/fixtures/default.png", "image/png") 
    @params = { member: {name:"横国太郎", position: "後衛", from: "横浜高校", 
                  text: "生粋のハマっ子。最近パチンコにハマってるカス野郎",
                  department: "教育学部", director: "副将", 
                  word: "どこだよそれFランジャーン", 
                  addmission_date: DateTime.now, image: image}}
    @member = members(:example_member)
    @other_member = members(:example_member_destroy)
  end
  
  test "should get new" do
    log_in_as
    get new_member_path
    assert_response :success
  end
  
  test "name should be present" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    @params[:member][:name] = " "
    post members_path, params: @params
    assert flash.empty?
    assert_select "div.alert", "The form contains 1 error."
  end
  
  test "from should be present" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    @params[:member][:from] = " "
    post members_path, params: @params
    assert flash.empty?
    assert_select "div.alert", "The form contains 1 error."
  end
  
  test "text should be present" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    @params[:member][:text] = " "
    post members_path, params: @params
    assert flash.empty?
    assert_select "div.alert", "The form contains 1 error."
  end
  
  test "department should be present" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    @params[:member][:department] = " "
    post members_path, params: @params
    assert flash.empty?
    assert_select "div.alert", "The form contains 1 error."
  end
  
  
  test "word should be present" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    @params[:member][:word] = " "
    post members_path, params: @params
    assert flash.empty?
    assert_select "div.alert", "The form contains 1 error."
  end
  
  test "addmission_date should be present" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    @params[:member][:addmission_date] = " "
    post members_path, params: @params
    assert flash.empty?
    assert_select "div.alert", "The form contains 1 error."
  end
  
  test "valid update" do
    log_in_as
    get edit_member_path(@member)
    assert_template "members/edit"
    @params[:member][:name] = "横浜ボブ"
    patch member_path(@member), params: @params
    assert_redirected_to members_url
    follow_redirect!
    assert_not flash.empty?
    @member.reload
    assert_equal @member.name, "横浜ボブ"
  end
  
  test "destroy member" do
    log_in_as
    get members_path
    assert_difference "Member.count", -1 do
      delete member_path(@other_member)
    end
    assert_redirected_to members_url
    follow_redirect!
    assert_not flash.empty?
  end
  
  
end
