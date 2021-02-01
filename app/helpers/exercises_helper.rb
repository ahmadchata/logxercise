module ExercisesHelper
  def sum
    current_user.exercises.sum(:duration)
  end
end
