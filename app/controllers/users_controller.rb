class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:confirm_password]
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
    params.require(:user).permit(:first_name, :last_name, :course, :linked_in, :twitter, :facebook, :github,  :password, :email, :avatar)
  end

end
