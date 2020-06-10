module CurrentCart
	private

	def set_cart
		@cart = Cart.find(sessions[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = id
	end
end
