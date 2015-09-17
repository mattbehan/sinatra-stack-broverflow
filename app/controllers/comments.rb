# before "/:commentable_type/:commentable_id/comment*" do
#   # @commentable = Comment.find_by(commentable_type: params[:commentable_type], commentable_id: params[:commentable_id])
#   if params[:commentable_type] == "Question"
#     @commentable = Question.find_by(params[:commentable_id])
#     @question = @commentable
#   else
#     @commentable = Answer.find_by(params[:commentable_id])
#     @question = @commentable.question
#     @answers = @question.answers
#   end

# end

# # this route is explicitly
# get "/:commentable_type/:commentable_id/comments/new" do
#   if authenticated?
#     if request.xhr?
#       erb :"comments/new", layout: false
#     else
#       erb :"comments/new"
#     end
#   else
#     if request.xhr?
#       status 401
#       "You must log in to write comments"
#     else
#       @commenting_but_not_logged_in = true
#       erb :"question/show"
#     end
# end

# # post "/:commentable_type/:commentable_id/comments" do
# #   if authenticated?
# #     @comment = Comment.new(user_id: sessions_user_id, text: params[:comment_text])
# #     if @commentable && @comment.save
# #       @commentable.comments << @comment
# #       if request.xhr?
# #         content_type :json
# #         @comment.to_json
# #       else
# #         redirect "/questions/#{@question.id}"
# #       end
# #   else
# #     if request.xhr?
# #       status 401
# #       "You must log in to write comments"
# #     else
# #       @commenting_but_not_logged_in = true
# #       erb :"question/show"
# #     end
# #   end
# # end

