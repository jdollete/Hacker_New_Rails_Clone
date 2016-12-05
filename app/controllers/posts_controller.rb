class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    @post.user_id = current_user.id
     if @post.save
       redirect_to @post
     else
       render 'new'
     end
  end

  def show
    @post = Post.find(params[:id])
  end
  private
    def post_params
      params.require(:post).permit(:title,:body)
    end
end
