ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def log_in_as
    session[:log_in] = true
  end

  class ActionDispatch::IntegrationTest
    def log_in_as
      post login_path, params: { login_edituser: { user_name: "横国軟式庭球部編集者",
                          password: "yunsofttennis4559" }}
    end
  end
  # Add more helper methods to be used by all tests here...
end
