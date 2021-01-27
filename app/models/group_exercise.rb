class GroupExercise < ApplicationRecord
  belongs_to :group
  belongs_to :author, foreign_key: 'exercise_id', class_name: 'Exercise'
end
