class CommentsController < ApplicationController

def new
  @comment = Comment.new
end

def create
  @post = Post.find(params[:post_id])
  @comment = Comment.new(comment_params)
  @comment.user_id = current_user.id
  @comment.post_id = params[:post_id]
   if @comment.save
  redirect_to @post
end
end

private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
