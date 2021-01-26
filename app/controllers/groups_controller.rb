class GroupsController < ApplicationController
  before_action :require_login
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "Group created"
      redirect_to groups_path
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
