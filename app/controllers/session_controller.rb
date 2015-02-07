class SessionController < ApplicationController
  def new
    if !session[:user_id]
      render :new
    else
      redirect_to session[:page_id]
    end
  end

  def create
    user = User.find_by(screen_name: params[:screen_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:page_id]
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :back
  end
end
