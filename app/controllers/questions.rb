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
  # p params[:question].merge(session[:user_id])
  # p params[:question].merge("user_id" => 1)
  Question.create(params[:question].merge("user_id" => 1))

  redirect '/'
end

post '/questions/:id/votes/1' do
  votes = Question.find_by(id: params[:id]).votes
  votes.each do |vote|
    if vote.user_id == session[:user_id]
      return
    else
      Vote.create(user_id: session[:user_id], votable_id: 1,votable_type: "Question", value: 1)
    end
  end
end

post '/questions/:id/votes/-1' do

end