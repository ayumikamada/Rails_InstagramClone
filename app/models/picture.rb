class Picture < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  THUMBNAIL_SIZE = [700, 700]
end