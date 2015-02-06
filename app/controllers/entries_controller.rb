class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by(id: params[:id])
  end

  def new

    @entry = Entry.new
    @entry[:topic_id] = params[:topic_id]
  end

  def create
    @entry = Entry.create(entry_params)
    redirect_to @entry
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    @entry.update_attributes(entries_params)

    redirect_to @entry
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    Entry.destroy(params[:id])

    redirect_to topic_path(@entry.topic_id)
  end

  private
  def entry_params
  params.require(:entry).permit(:title, :user_id, :content)
  end

end
