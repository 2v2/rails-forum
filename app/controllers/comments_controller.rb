class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by(id: params[:id], :include => :user)
  end

  def new
    @entry = Entry.find_by(id: params[:entry_id])
    @new_comment = Comment.new
    binding.pry
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to :back
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update_attributes(comment_params)

    redirect_to @comment
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    comment.destroy(params[:id])

    redirect_to entry_path(@comment.entry_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content, :entry_id)
  end

end