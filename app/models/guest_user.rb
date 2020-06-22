class GuestUser < User
	attr_accessor(:name, :first_name, :last_name, :email, :combine_items)

	def combine_items
		[]
	end
end
