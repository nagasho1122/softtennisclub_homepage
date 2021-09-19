module LoginEdituserHelper
  
  def log_in
    session[:log_in] = true
  end
  
  def log_out
    session[:log_in] = false
  end
  
  def logged_in?
    session[:log_in]
  end
end
