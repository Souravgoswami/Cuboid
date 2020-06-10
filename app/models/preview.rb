class Preview < ApplicationRecord
  belongs_to :product
  mount_uploader :image, PreviewUploader
  validates_presence_of :image
end
