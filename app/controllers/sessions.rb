enable :sessions

get '/sessions/login' do
  erb :"sessions/login"
end

post '/sessions' do
  @login_info = params[:user]
  p params[:user]
  @user = User.authenticate(@login_info[:username], @login_info[:password])

  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    redirect "/users/new"
  end
end

get '/sessions/logout' do
  session.clear
  redirect "/"
end