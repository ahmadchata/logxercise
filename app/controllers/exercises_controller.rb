class ExercisesController < ApplicationController
  before_action :require_login
  def index
    @exercises = Exercise.all
  end
end
