module CurrentUserConcern
	extend ActiveSupport::Concern

	included do
		before_action :current_user
	end

	def current_user
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new

		guest.name = 'Guest Guest'
		guest.first_name, guest.last_name = *guest.name.split.values_at(0, -1)
		guest.email = 'guest@guest.net'

		guest
	end
end
