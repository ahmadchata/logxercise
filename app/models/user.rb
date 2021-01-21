class User < ApplicationRecord
  has_many :groups
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 15 }
end
