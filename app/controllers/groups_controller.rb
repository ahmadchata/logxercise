class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
  end

  private
    def group_prams
      params.require(:group).permit(:name)
    end
end
