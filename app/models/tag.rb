class Tag < ApplicationRecord
  belongs_to :product
  validates :title, presence: true, length: { minimum: 3 }
end
