class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:name])
    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid name'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
