class LoginEdituserController < ApplicationController
  
  def login
  end
  
  def create
    if login_check(user_params)
      flash[:success] = "ログインに成功しました。各項目を編集できます。"
      log_in
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザー名またはパスワードが正しくありません。"
      render "login"
    end
  end
  
  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
  
  private
  
    def user_params
      params.require(:login_edituser).permit(:user_name, :password)
    end
    
    def login_check(user_params)
      user_name = Rails.application.credentials.dig(:login, :user_name)
      password = Rails.application.credentials.dig(:login, :password)
      if user_params[:user_name] == user_name && user_params[:password] == password
        return true
      else
        return false
      end
    end
  
end
