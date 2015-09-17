# Voting functionality
get '/answers/:id/votes/:value' do
  answer = Answer.find_by(id: params[:id])
  votes = answer.votes
  destroy_old_vote_and_create_new_vote(votes,session[:user_id],params[:value])

  redirect "/questions/#{answer.question_id}"
end