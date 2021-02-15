class RemoveReferencesFromExercise < ActiveRecord::Migration[6.1]
  def change
    remove_reference :exercises, :group, index: true, foreign_key: true
  end
end
