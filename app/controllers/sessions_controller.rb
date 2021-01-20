class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(current_user), notice: 'Logged in!'
    else
      flash.now[:danger] = 'Invalid name'
      render 'new'
    end
  end
end
