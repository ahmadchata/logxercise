class ExercisesController < ApplicationController
  before_action :require_login
  def index
    @exercises = Exercise.all
  end

  def new
  end

  def create
    @exercise = current_user.exercises.build(exercise_param)
    @groups = params[:exercise][:group_ids]
    # @groups = params[:exercise][:group_ids]
    # @groups.each do |g|
    #   gp = Group.find(g)
      # @exercise.groups << Group.find(1)
    # end
     if @exercise.save
      flash[:success] = "Exercise created"
      redirect_to exercises_path
    else
      render 'exercises/new'
    end

  end

  private
    def exercise_param
      params.require(:exercise).permit(:name, :duration)
    end
end
