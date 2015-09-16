get '/user' do
  @users = User.all
  erb :"login"
end

post '/login' do
  logger.info params

  @user = User.new(params[:user])

  # if @user.save
  #   erb :"_user"
  # else
  #   status 404
  # end
end