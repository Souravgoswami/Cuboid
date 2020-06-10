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

	def cart_count_over_one
		if @cart.line_items.count > 0
			return "<span>#{cart.line_items.count}</span>".html_safe
		end
	end

	def cart_has_items
		return @cart.line_items.count > 0
	end

	def notifications
		msg = flash[:notice] || flash[:alert] || flash[:error]
		alert_generator(msg).html_safe if msg
	end

	def alert_generator(msg = '', button_message = 'Ok')
		%[<script>notify("#{msg}", "#{button_message}")</script>].html_safe
	end

	def format_tags(x, str = '', highlight = nil, css_class = "links")
		t = x.tags.map(&:title)

		unless highlight
			t.map! do |x|
				%[<a href="tags/#{x}" class="#{css_class}" data-content="#{x}">#{x}</a>]
			end
		else
			t.map! do |x|
				v = %[<a href="#{x}" class="#{css_class}" data-content="#{x}">#{x}</a>]

				if x == highlight
					v.prepend('<strong>')
					v << '</strong>'
				end

				v
			end
		end

		t.empty? ? '' : %[<span class="no-user-select">#{str} #{t.join(', ')}</span>]
	end

	# TODO:
	# def guest_user_language_prefs
	# 	if current_user.is_a?(GuestUser)
	# 		button_to "EN", class:"dropdown-item"
	# 	end
	# end
end
