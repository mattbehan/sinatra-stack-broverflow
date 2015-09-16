post '/answers' do
  Answer.create(user_id: session[:user_id], text: params["answer-text"],question_id: params[:question_id])

  redirect '/questions/'params[:question_id]
end