class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "Group created"
      redirect_to group_path
    else
      render 'group/new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
