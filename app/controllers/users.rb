get '/users/new' do
  erb :"users/new"
end

post '/users' do
  User.create(params[:user])
  erb :"index"
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end
