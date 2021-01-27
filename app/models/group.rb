class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], mesaage: "must be a valid image format" }, size: { less_than: 3.megabytes, message: "should be less than 3MB" }

  # Returns a resized image
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
