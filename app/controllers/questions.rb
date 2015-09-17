get '/questions' do
  @questions = Question.all

  erb :"questions/index"
end

get '/questions/new' do
  erb :"/questions/new"
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answers = Answer.where(question_id: @question.id)

  erb :"/questions/show"
end

post '/questions' do
  Question.create(params[:question].merge("user_id" => 1))

  redirect '/'
end

get '/questions/:id/votes/:value' do
  votes = Question.find_by(id: params[:id]).votes
  destroy_old_vote_and_create_new_vote(votes,session[:user_id],params[:value])

  redirect "/questions/#{params[:id]}"
end

# get '/questions/:id/votes/-1' do
#   votes = Question.find_by(id: params[:id]).votes
#   destroy_old_vote_and_create_new_vote(votes,session[:user_id],-1)

#   redirect "/questions/#{params[:id]}"
# end

post '/questions/:id/answers' do
  Answer.create(user_id: session[:user_id], text: params["answer-text"],question_id: params[:id])

  redirect "/questions/#{params[:id]}"
end
