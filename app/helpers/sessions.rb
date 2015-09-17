def current_user
  @current ||= User.find(session[:user_id]) if authenticated?
end

def authenticated?
  session[:user_id] != nil
end

def sessions_user_id
  @sessions_user_id ||= session[:user_id]
end

def authorized? id
  sessions_user_id == id.to_i
end