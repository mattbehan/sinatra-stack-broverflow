get '/' do
  redirect '/questions'
end

get "/session/viewer" do
  session.inspect
end

get "/session/clear" do
  session.clear
end
