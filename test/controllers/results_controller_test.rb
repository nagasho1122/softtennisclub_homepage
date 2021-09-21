require "test_helper"

class ResultsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @result = results(:example_result_one)
    @other_result = results(:example_result_two)
    file = Rack::Test::UploadedFile.new("test/fixtures/sample.pdf", "application/pdf") 
    @result.document.attach(file)
    @other_result.document.attach(file)
  end
  
  test "should get new" do
    log_in_as
    get results_new_url
    assert_response :success
  end
  
  test "name should be present" do
    log_in_as
    get new_result_path
    assert_template "results/new"
    post results_path, params: {result: { name: "　" }}
    assert flash.empty?
    assert_select "div.alert", "The form contains 2 errors."
  end
  
  test "valid update" do
    log_in_as
    file = Rack::Test::UploadedFile.new("test/fixtures/sample.pdf", "application/pdf") 
    get edit_result_path(@result)
    assert_template "results/edit"
    patch result_path(@result), params: {result: { name: "2020年関東リーグ", 
                                document: file}}
    assert_redirected_to results_url
    follow_redirect!
    assert_not flash.empty?
    @result.reload
    assert_equal @result.name, "2020年関東リーグ"
  end
  
  test "destroy result" do
    log_in_as
    get results_path
    assert_difference "Result.count", -1 do
      delete result_path(@other_result)
    end
    assert_redirected_to results_url
    follow_redirect!
    assert_not flash.empty?
  end
  
end
