get '/' do
  erb :"index"
end

get '/restricted_area' do
  if session[:user_id] == nil
    redirect '/'
  else
    erb :"restricted_area"
  end
end
