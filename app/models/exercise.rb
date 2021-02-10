class Exercise < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :duration, presence: true

  belongs_to :user
  has_many :group_exercises
  has_many :groups, through: :group_exercises
  scope :desc, -> { order(created_at: :desc) }
end
