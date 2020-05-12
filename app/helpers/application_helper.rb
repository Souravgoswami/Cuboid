module ApplicationHelper
	def login_helper(css_class='', img_width=14)
		unless current_user.is_a?(GuestUser)
			link_to(destroy_user_session_path, class: "#{css_class} link-1") do
				image_tag('preferences.svg', width: "#{img_width}px") +
				" Preferences"
			end +

			link_to(destroy_user_session_path, class: css_class) do
				image_tag('orders.svg', width: "#{img_width}px") +
				" Orders"
			end +

			link_to(destroy_user_session_path, class: css_class) do
				image_tag('sell.svg', width: "#{img_width}px") +
				" Sell"
			end +

			link_to(destroy_user_session_path, method: :delete, class: css_class) do
				image_tag('logout.svg', width: "#{img_width}px") +
				" Logout"
			end
		else
			link_to(new_user_registration_path, class: css_class) do
				image_tag('signup.svg', width: "#{img_width}px") +
				' Sign Up'
			end + ' '.html_safe +

			link_to(new_user_session_path, class: css_class) do
				image_tag('login.svg', width: "#{img_width}px") +
				' Login'
			end
		end
	end

	def random_string_generator(range=4..6)
		rand(range).times.map { rand(97..122).chr }.join
	end

	def random_number_generator(range=10)
		rand(range).times.map { rand(0..9) }.join.to_i
	end

	def random_colours
		"##{6.times.map { [ (?a..?f).to_a.sample, (0..9).to_a.sample].sample }.join}"
	end

	# TODO:
	# def guest_user_language_prefs
	# 	if current_user.is_a?(GuestUser)
	# 		button_to "EN", class:"dropdown-item"
	# 	end
	# end
end
