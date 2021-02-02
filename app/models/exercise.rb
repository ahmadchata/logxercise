class Exercise < ApplicationRecord
  validates :name, :duration, presence: true

  belongs_to :user, foreign_key: :author_id
  has_many :group_exercises
  has_many :groups, through: :group_exercises
end
