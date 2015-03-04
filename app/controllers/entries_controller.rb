class EntriesController < ApplicationController

  def show
    @user = User.find_by(id: session[:user_id])
    @entry = Entry.includes(:viewers, :comments).find(params[:id])
    session[:page_id] = topic_entry_path(@entry.topic, @entry)
      if @entry.is_viewer?(@user)
        render :show
      else
        redirect_to session[:page_id]
      end
    
    @new_comment = Comment.new
  end

  def new
    @courses = Course.all()
    @user = User.find_by(id: session[:user_id])
    if session[:user_id]
      @topic = Topic.find_by(id: params[:topic_id])
      @new_entry = @topic.entries.build
    else
      redirect_to session[:page_id]
    end
  end

  def create
    @entry = Entry.create(entry_params)
    binding.pry
    redirect_to [@entry.topic, @entry]
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
    if session[:user_id] == @entry.user_id
    else
      redirect_to session[:page_id]
    end

  end

  def update
    @entry = Entry.find_by(id: params[:id])
    @entry.update_attributes(entry_params)

    redirect_to [@entry.topic, @entry]
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    @comments = Comment.where(entry_id: @entry.id)
    @comments.each do |comment|
      Comment.destroy(comment)
    end
    Entry.destroy(params[:id])


    redirect_to topic_path(@entry.topic_id)
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :user_id, :content, :topic_id, :comment_num, :course_id)
  end

end
