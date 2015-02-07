class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by(id: params[:id])
  end

  def new
    @topic = Topic.find_by(id: params[:topic_id])
    @new_entry = @topic.entries.build
  end

  def create
    @entry = Entry.create(entry_params)
    redirect_to [@entry.topic, @entry]
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    @entry.update_attributes(entry_params)

    redirect_to [@entry.topic, @entry]
    end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    Entry.destroy(params[:id])

    redirect_to topic_path(@entry.topic_id)
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :user_id, :content, :topic_id)
  end

end