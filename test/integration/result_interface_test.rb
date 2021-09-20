require "test_helper"

class ResultInterfaceTest < ActionDispatch::IntegrationTest
  
  test "successful upload image" do
    log_in_as
    get new_result_path
    assert_template "results/new"
    assert_select "input[type= file]"
    document = fixture_file_upload('test/fixtures/sample.pdf', 'application/pdf')
    assert_difference "Result.count" do
      post results_path, params:{ result: {name: "2020年関東リーグ",
                         document: document}}
    end
    assert Result.find_by(name: "2020年関東リーグ").document.attached?
  end
  
end
