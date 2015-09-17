get '/users/new' do
  erb :"users/new"
end

post '/users' do
  User.create(params[:user])
  erb :"index"
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if !current_user
    redirect "/sessions/login"
  elsif current_user.id.to_i != params[:id].to_i
    redirect "users/#{current_user.id}"
  else
    erb :"users/show"
  end
end
