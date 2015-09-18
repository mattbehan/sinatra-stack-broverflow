# Voting functionality
get '/answers/:id/votes/:value' do
  answer = Answer.find_by(id: params[:id])
  votes = answer.votes
  destroy_old_vote_and_create_new_vote(votes,session[:user_id],params[:value])

  if request.xhr?
    answer.sum_votes_for_answer.to_s
  else
    redirect "/questions/#{answer.question_id}"
  end
end
