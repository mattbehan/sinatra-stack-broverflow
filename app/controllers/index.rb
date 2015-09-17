get '/' do
  redirect '/questions'
end

get '/restricted_area' do
  if session[:user_id] == nil
    redirect '/'
  else
    redirect '/questions'
  end
end
