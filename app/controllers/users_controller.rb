class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Sign up successful"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Name was updated successfully"
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
