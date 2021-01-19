class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:name])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid name'
      render 'new'
    end
  end
end
