class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
end
