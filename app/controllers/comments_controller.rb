class CommentsController < ApplicationController

  def new
    @entry = Entry.find_by(id: params[:entry_id])
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @entry = Entry.find_by(id: @comment.entry_id)
    new_entry = @entry[:comment_num]+1
    @entry.update_attributes({comment_num: new_entry})
    redirect_to :back
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    if session[:user_id] == @comment.user_id
    else
      redirect_to session[:page_id]
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update_attributes(comment_params)

    redirect_to [@comment.entry.topic, @comment.entry]
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @entry = Entry.find_by(id: @comment.entry_id)
    new_entry = @entry[:comment_num]-1
    @entry.update_attributes({comment_num: new_entry})
    Comment.destroy(params[:id])

    redirect_to [@comment.entry.topic, @comment.entry]
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content, :entry_id)
  end

end
