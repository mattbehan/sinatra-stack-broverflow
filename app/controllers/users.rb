get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.create(params[:user])
  if @user.save
    erb :"confirm-account"
  else
    erb :"users/new"
  end
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
