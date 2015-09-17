get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "No User Found"
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)

  redirect '/login'
end
