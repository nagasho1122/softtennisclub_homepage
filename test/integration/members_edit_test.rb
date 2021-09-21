require "test_helper"

class MembersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @member = members(:example_member)
  end
  
  test "unsuccessful edit" do
    log_in_as
    get edit_member_path(@member)
    assert_template "members/edit"
    image = Rack::Test::UploadedFile.new("test/fixtures/default.png", "image/png") 
    patch member_path(@member), params:{ member: {name:" ", position: "後衛", from: "横浜高校", 
                  text: "生粋のハマっ子。最近パチンコにハマってるカス野郎",
                  department: "教育学部", director: "副将", 
                  word: "どこだよそれFランジャーン",
                  addmission_date: DateTime.now, image: image}}
    assert_template "members/edit"
    assert_select "div.alert", "The form contains 1 error."
  end
  
  test "successful edit" do
    log_in_as
    image = Rack::Test::UploadedFile.new("test/fixtures/default.png", "image/png") 
    get edit_member_path(@member)
    assert_template "members/edit"
    name = "横浜新之助"
    patch member_path(@member), params:{ member: {name: name, position: "後衛", from: "横浜高校", 
                  text: "生粋のハマっ子。最近パチンコにハマってるカス野郎",
                  department: "教育学部", director: "副将", 
                  word: "どこだよそれFランジャーン", 
                  addmission_date: DateTime.now, image: image}}
    assert_not flash.empty?
    assert_redirected_to members_path
    @member.reload
    assert_equal name, @member.name
  end
  
end
