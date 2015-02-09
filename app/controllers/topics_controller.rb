class TopicsController < ApplicationController

  def index
    session[:page_id] = '/'
    @user = User.find_by(id: session[:user_id])
    @topics = Topic.all()
  end

  def show
    page = params["page"] || 1
    page = page.to_i
    binding.pry
  	@user = User.find_by(id: session[:user_id])
    @topic = Topic.find_by(id: params[:id])
    count = 1
    @topic.entries.in_groups_of(10) do |group|
      puts group
      if count == page
        binding.pry
        @entries = group
      end
      count+=1
    end
    
    session[:page_id] = topic_path(@topic)
  end

end

