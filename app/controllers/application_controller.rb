class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def ensure_logged_out
    redirect_to dashboard_url if logged_in?
  end
  
  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end
  
  def logged_in?
    !!current_user
  end
  
  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  
  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end