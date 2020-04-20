class Post < ApplicationRecord
  validates :title, :summary, :body, presence: true

  mount_uploader :image, ImageUploader
end
