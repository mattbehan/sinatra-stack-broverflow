get '/login' do
  erb :"login", layout: false
end

post '/login' do
  user = User.find_by(email: params[:email])
  logger.info "user is #{user}"

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/questions"
  else
    @error = "No User Found"
    redirect "/login"
  end
end

get '/logout' do
  session.delete(:user_id)

  redirect '/login'
end
