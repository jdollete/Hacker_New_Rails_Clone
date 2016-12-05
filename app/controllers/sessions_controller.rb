class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    session.clear
    redirect_to posts_path
  end
end
