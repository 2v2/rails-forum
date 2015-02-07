class TopicsController < ApplicationController

  def index
    
    @user = User.find_by(id: session[:user_id])
    binding.pry
    @topics = Topic.all()
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end

end

