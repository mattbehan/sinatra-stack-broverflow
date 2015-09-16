get '/questions' do
  @questions = Question.all

  erb :"/questions/index"
end

get '/questions/:id' do
  @question = Question.find_by(params[:id])
  @answers = Answer.find_by(question_id: @question.id)

  erb :"/questions/show"
end

get '/questions/new' do
  erb :"/questions/new"
end

post '/questions' do
  Question.create(params[:question],user_id: session[:user_id])

  redirect '/'
end