class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :group_exercises, dependent: :destroy
  has_many :exercises, through: :group_exercises

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], mesaage: "must be a valid image format" }, size: { less_than: 3.megabytes, message: "should be less than 3MB" }

  # Returns a resized image
  def display_image
    if image.attached?
      image.variant(resize_to_limit: [80, 80])
    else
      image.attach(io: File.open(Rails.root.join("app", "assets", "images", "microverse.jpg")), filename: 'microverse.jpg' , content_type: "image/jpg")
    end
    # image.attached? ? image.variant(resize_to_limit: [80, 80]) : 'app/assets/images/default.png'
  end
end
