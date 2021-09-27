require "test_helper"

class MembersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @member1 = members(:example_member)
    @member2 = members(:example_member_destroy)
    @member3 = members(:example_member_thirdgrade)
    @member4 = members(:example_member_forthgrade)
  end
  
  test "should be valid grade layout" do
    log_in_as
    get members_path
    assert_template "members/index"
    assert_equal Member.count, 4
    assert_equal @member1.addmission_date, DateTime.new(2021, 4, 1, 0, 0, 0)
    assert_select "div.member-box", count: 4
    delete member_path(@member2)
    assert_redirected_to members_url
    follow_redirect!
    assert_select "div.member-box", count: 3
  end
  
end
