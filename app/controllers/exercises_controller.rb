class ExercisesController < ApplicationController
  before_action :require_login
  def index
    @exercises = Exercise.all
  end

  def new
    @exercises = Exercise.new
    @groups = Group.all
  end

  def create
    byebug
    @exercise = Exercise.new(exercise_params)
    # @exercise = current_user.exercises.build(exercise_param)
    unless params[:exercise][:groups].nil?
      @group = Group.find(params[:exercise][:groups].to_i)
      @exercise.groups << @group

    # current_exercise_group = @exercise.groups
    # @groups.each do |g|
    #   unless g.empty?
    #     gp = Group.find(g)
    #     @exercise.groups << gp unless current_exercise_group.include?(gp)
    #   end
    end
     if @exercise.save
      flash[:success] = "Exercise created"
      redirect_to exercises_path
    else
      render 'exercises/new'
    end

  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :duration)
    end
end
