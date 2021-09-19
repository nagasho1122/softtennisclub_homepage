class ApplicationController < ActionController::Base
  include LoginEdituserHelper
  
  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
  
end
