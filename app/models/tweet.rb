class Tweet < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user 
  mount_uploader :photo, ImageUploader
  has_one_attached :image

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
