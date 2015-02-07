class TopicsController < ApplicationController

  def index
    session[:page_id] = '/'
    @user = User.find_by(id: session[:user_id])
    @topics = Topic.all()
  end

  def show
  	@user = User.find_by(id: session[:user_id])
    @topic = Topic.find_by(id: params[:id])
    session[:page_id] = topic_path(@topic)
  end

end

