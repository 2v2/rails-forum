class TopicsController < ApplicationController

  def index
    session[:page_id] = '/'
    @user = User.find_by(id: session[:user_id])
    @topics = Topic.all()
  end

  def show
    @page = params["page"] || 1
    @page = @page.to_i

  	@user = User.find_by(id: session[:user_id])
    @topic = Topic.find_by(id: params[:id])
    count = 1
    
    all_entries = @topic.entries
    @pages = (all_entries.length/10) + 1
    if @page < 1 || @pages < @page

      @page = @pages

    end
    all_entries.in_groups_of(10) do |group|
      if count == @page
        @entries = group
      end
      count+=1
    end
    
    session[:page_id] = topic_path(@topic) + "?page=" + @page.to_s

  end

end

