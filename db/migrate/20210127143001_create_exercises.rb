class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :duration
      t.references :user, null: false, foreign_key: true, column: :author_id
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
