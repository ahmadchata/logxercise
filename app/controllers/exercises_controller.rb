class ExercisesController < ApplicationController
  before_action :require_login
  def index
    @exercises = Exercise.all
  end

  def new
    @groups = Group.all
  end

  def create
    @exercise = current_user.exercises.build(exercise_param)
    @exercises.group_id = 1

  end

  private
    def exercise_param
      params.require(:exercise).permit(:name, :duration)
    end
end
