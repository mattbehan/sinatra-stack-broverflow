def current_user
  @current ||= User.find(session[:user_id]) if authenticated?
end

def authenticated?
  session[:user_id] != nil
end