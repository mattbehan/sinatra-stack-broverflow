before "/:commentable_type/:commentable_id/comment*" do
  if params[:commentable_type] == "Question"
    @commentable = Question.find(params[:commentable_id])
    @question = @commentable
  else
    @commentable = Answer.find(params[:commentable_id])
    @question = @commentable.question
  end
  @answers = @question.answers
end

get "/:commentable_type/:commentable_id/comments/new" do
  @commment = Comment.new
  if authenticated?
    if request.xhr?
      erb :"comments/new", layout: false
    else
      erb :"comments/new"
    end
  else
    if request.xhr?
      status 401
      "You must log in to write comments"
    else
      @not_authenticated = true
      erb :"questions/show"
    end
  end
end

post "/:commentable_type/:commentable_id/comments" do
  if authenticated?
    @comment = Comment.new(user_id: sessions_user_id, text: params[:comment_text])
    if @commentable && @comment.save
      @commentable.comments << @comment
      if request.xhr?
        content_type :json
        @comment.to_json
      else
        redirect "/questions/#{@question.id}"
      end
    else
      if request.xhr?
        status 422
        content_type :json
        @comment.to_json
      else
      end
    end
  else
    if request.xhr?
      status 401
      "You must log in to write comments"
    else
      @not_authenticated = true
      erb :"question/show"
    end
  end
end

get "/:commentable_type/:commentable_id/comments/:comment_id/edit" do
  @comment = Comment.find(params[:comment_id])
  if authorized?(@comment.user_id)
    erb :"comments/edit"
  else
    @not_authorized = true
    erb :"questions/show"
  end
end

put "/:commentable_type/:commentable_id/comments/:comment_id" do
  @comment = Comment.find(params[:comment_id])
  if authorized?(@comment.user_id)
    valid_edit = @comment.update_attributes(text: params[:comment_text])
    if valid_edit
      if request.xhr?
        content_type :json
        @comment.to_json
      else
        redirect "/questions/#{@question.id}"
      end
    else
      if request.xhr?
        status 422
        "Invalid comment data. Text must not be blank."
      else
        # have to create the erb for comments/show and do error handling
        erb :"questions/show"
      end
    end
  else
    if request.xhr?
      status 403
      "You do not have permission to edit this"
    else
      @not_authorized = true
      erb :"questions/show"
    end
  end
end

delete  "/:commentable_type/:commentable_id/comments/:comment_id" do
  @comment = Comment.find(params[:comment_id])
  if authorized?(@comment.user_id)
    if request.xhr?
      x = @comment.destroy
    else
      @comment.destroy
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      status 403
      "You do not have permission to delete this"
    else
      @not_authorized = true
      erb :"questions/show"
    end
  end
end

