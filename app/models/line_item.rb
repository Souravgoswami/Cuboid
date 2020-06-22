class LineItem < ApplicationRecord
	belongs_to :product
	belongs_to :user

	def total_price
		product.price.to_i * quantity.to_i
	end
end
