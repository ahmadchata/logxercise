class CreateGroupExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :group_exercises do |t|
      t.integer "group_id"
      t.integer "exercise_id"

      t.timestamps
    end
  end
end
