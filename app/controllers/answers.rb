post '/answers' do
  # Answer.create(user_id: session[:user_id], text: params["answer-text"],question_id: params[:question_id])
  Answer.create(user_id: session[:user_id], text: params["answer-text"],question_id: params[:question_id])

  redirect "/questions/#{params[:question_id]}"
end

get '/answers/:id/votes/1' do
  answer = Answer.find_by(id: params[:id])
  votes = answer.votes
  destroy_old_vote_and_create_new_vote(votes,session[:user_id],1)

  redirect "/questions/#{answer.question_id}"
end

get '/answers/:id/votes/-1' do
  answer = Answer.find_by(id: params[:id])
  votes = answer.votes
  destroy_old_vote_and_create_new_vote(votes,session[:user_id],-1)

  redirect "/questions/#{answer.question_id}"
end