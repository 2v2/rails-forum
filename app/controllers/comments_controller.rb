class CommentsController < ApplicationController

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def new
    @entry = Entry.find_by(id: params[:entry_id])
    @new_comment = @entry.comments.build
  end

  def create
    @comment = comment.create(comment_params)
    redirect_to :back
  end

  def edit
    @comment = comment.find_by(id: params[:id])
  end

  def update
    @comment = comment.find_by(id: params[:id])
    @comment.update_attributes(comment_params)

    redirect_to @comment
  end

  def destroy
    @comment = comment.find_by(id: params[:id])
    comment.destroy(params[:id])

    redirect_to entry_path(@comment.entry_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :user_id, :content, :entry_id)
  end

end