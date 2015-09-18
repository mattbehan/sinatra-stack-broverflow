get '/users/new' do
  erb :"users/new", layout: false
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    erb :"/login", layout: false
  else
    redirect "/users/new"
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
