require "test_helper"

class MemberTest < ActiveSupport::TestCase
  
  def setup
     @member = Member.new(name:"横国太郎", position: "後衛", from: "横浜高校", 
                  text: "生粋のハマっ子。最近パチンコにハマってるカス野郎",
                  department: "教育学部", director: "副将", 
                  word: "どこだよそれFランジャーン", addmission_date: DateTime.now)
  end
  
  test "should be valid" do
    assert @member.valid?
  end
  
  test "name should be present" do
    @member.name = "  "
    assert_not @member.valid?
  end
  
  test "position should be present" do
    @member.position = "  "
    assert_not @member.valid?
  end
  
  test "from should be present" do
    @member.from = "  "
    assert_not @member.valid?
  end
  
  test "text should be present" do
    @member.text = "  "
    assert_not @member.valid?
  end
  
  test "department should be present" do
    @member.department = "  "
    assert_not @member.valid?
  end
  
  test "director should be present" do
    @member.director = "  "
    assert @member.valid?
  end
  
  test "word should be present" do
    @member.word = "  "
    assert_not @member.valid?
  end
  
  test "name should not be too long" do
    @member.name = "a"*16
    assert_not @member.valid?
  end
  
  test "position should not be too long" do
    @member.position = "a"*11
    assert_not @member.valid?
  end
  
  test "from should not be too long" do
    @member.from = "a"*21
    assert_not @member.valid?
  end
  
  test "text should not be too long" do
    @member.text = "a"*256
    assert_not @member.valid?
  end
  
  test "department should not be too long" do
    @member.department = "a"*26
    assert_not @member.valid?
  end
  
  test "director should not be too long" do
    @member.director = "a"*16
    assert_not @member.valid?
  end
  
  test "word should not be too long" do
    @member.word = "a"*156
    assert_not @member.valid?
  end
  
end
