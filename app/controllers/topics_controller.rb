class TopicsController < ApplicationController

  def index
    session[:page_id] = '/'
    @user = User.find_by(id: session[:user_id])
    @topics = Topic.all()
  end
  
  def show
    page = params["page"] || 1
    page = page.to_i
    @user = User.find_by(id: session[:user_id])
    @topic = Topic.find_by(id: params[:id])
    count = 1
    all_entries = @topic.entries.order(:updated_at).reverse
    pages = (all_entries.length/10) + 1
    if pages == 0
      pages = 1
    end
    if page < 1
      page = 1
    end
    if pages < page
      page = pages
    end
    entries = []
    all_entries.in_groups_of(10) do |group|
      if count == page
        entries = group
      end
      count+=1
    end
    @pages = pages
    @page = page
    @entries = entries
    session[:page_id] = topic_path(@topic) + "?page=" + @page.to_s

  end

end
