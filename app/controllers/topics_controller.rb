class TopicsController < ApplicationController

  def index
    
    @user = User.find_by(id: session[:user_id])
    @topics = Topic.all()
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end

end

