class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:password]
      @user = User.create(params_user)
      redirect_to topics_path
    else
      redirect_to '/signup'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def params_user
    params.require(:user).permit(:screen_name, :password)
  end

end
