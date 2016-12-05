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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if authorized?(@post.user)
      @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to @post
        else
          render 'edit'
        end
    else
        @errors = "You must be logged in!"
        redirect_to sessions_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title,:body)
    end
end
