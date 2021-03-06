class ExercisesController < ApplicationController
  before_action :require_login
  def index
    @exercises = current_user.exercises.desc
  end

  def new
    @exercises = Exercise.new
    @groups = Group.all
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user_id = current_user.id
    unless params[:exercise][:groups].nil?
      @group = Group.find(params[:exercise][:groups])
      @exercise.groups << @group
    end
    if @exercise.save
      flash[:success] = 'Exercise created'
      redirect_to exercises_path
    else
      flash[:danger] = 'Something happened'
      @groups = Group.all
      render 'exercises/new'
    end
  end

  def ungrouped_exercises
    @all_exercises = Exercise.where(user_id: current_user.id).includes(:groups)
    @exer = []

    @all_exercises.each do |exercise|
      @exer << exercise if exercise.groups.empty?
    end

    @exer
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :duration)
  end
end
