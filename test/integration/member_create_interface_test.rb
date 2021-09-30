require "test_helper"

class MemberCreateInterfaceTest < ActionDispatch::IntegrationTest
  
  
  test "successful upload image" do
    log_in_as
    get new_member_path
    assert_template "members/new"
    assert_select "input[type= file]"
    image = fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpeg')
    assert_difference "Member.count" do
      post members_path, params:{ member: {name: "パンサーボブ", name_alphabet: "Pansa Bob",position: "後衛", from: "横浜高校", 
                    text: "生粋のハマっ子。最近パチンコにハマってるカス野郎",
                    department: "教育学部", director: "副将", 
                    word: "どこだよそれFランジャーン", 
                    addmission_date: DateTime.now, image: image}}
    end
    assert Member.find_by(name: "パンサーボブ").image.attached?
  end
  
end
