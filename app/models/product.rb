class Product < ApplicationRecord
	before_destroy :not_referenced_by_any_line_item
	# before_action :authneticate_user!
	belongs_to :user, optional: true

	# validates :title, :price, :features, presence: true
	# validates :description, length: { maximum: 1500, too_long: "Maximum %{count} characters are allowed}", minimum: 6, too_short: "Minimum %{count} characters are required" }
	# validates :title, length: { maximum: 64, too_long: "Maximum %{count} characters are allowed" }
	# validates :price, length: { maximum: 6 }
	# validates_presence_of :main_image, :thumbnail

	mount_uploader :thumbnail, ProductUploader
	mount_uploader :main_image, ProductUploader

	has_many :tags
	has_many :line_items
	has_many :wishlists
	has_many :reviews
	has_many :previews
	has_many :purchases

	accepts_nested_attributes_for :previews,
		allow_destroy: true,
		reject_if: ->attrs { attrs['image'].blank? }

	accepts_nested_attributes_for :reviews,
	allow_destroy: true,
	reject_if: ->attrs { attrs['rating'].blank? }

	private
	def not_referenced_by_any_line_item
		unless line_items.empty?
			errors.add(:base, 'Line items present')
			throw :abort
		end
	end
end
