class Post < ApplicationRecord
  validates :title, :summary, :body, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category

  mount_uploader :image, ImageUploader

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create
    end
  end
end
