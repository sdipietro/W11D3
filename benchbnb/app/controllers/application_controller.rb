class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
    # debugger
  end

  def logged_in?
    !!current_user
  end

  def logout!
    @current_user.reset_session_token!
    # debugger
    session[:session_token] = nil
    # debugger
  end

end
