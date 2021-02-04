class ExercisesController < ApplicationController
  before_action :require_login
  def index
    @exercises = Exercise.includes(:user).desc
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
      flash[:success] = "Exercise created"
      redirect_to exercises_path
    else
      flash[:danger] = "Something happened"
      @groups = Group.all
      render 'exercises/new'
    end
  end

   def ungrouped_books
    @all_exercises = Exercise.where_id_is(current_user.id).includes(:groups)
    @exercises = []

    @all_exercises.each do |exercise|
      @exercises << exercise if exercise.groups.empty?
    end

    @exercises
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :duration)
    end
end
