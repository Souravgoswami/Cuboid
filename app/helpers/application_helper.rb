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
				%[<a href="#{tag_path(x)}" class="#{css_class}" data-content="#{x}"></a>]
			end
		else
			t.map! do |x|
				v = %[<a href="#{x}" class="#{css_class}" data-content="#{x}">#{x}</a>]

				if x == highlight
					v.prepend('<strong>') << '</strong>'
				end

				v
			end
		end

		t.empty? ? '' : %[<span class="no-user-select">#{str} #{t.join(', ')}</span>]
	end

	def product_image(product)
		if product.thumbnail.thumbnail!.url
			image_tag product.thumbnail.thumbnail!.url, class: 'card-img-top'

		elsif product.thumbnail.url
			image_tag product.thumbnail.url, class: 'card-img-top'

		elsif product.main_image.thumbnail!.url
			image_tag product.main_image.thumbnail!.url, class: 'card-img-top'

		elsif product.main_image.url
			image_tag product.main_image.url, class: 'card-img-top'

		else
			%Q[<div class="no-img-label">No Preview Available!</div>].html_safe
		end
	end

	def convert_emoji_to_html(str)
		%[&#x#{str.force_encoding(Encoding::UTF_8).dump[3..-2].tap { |x| x.delete!('{}') }};]
	end

	def print_clock_emoji(n)
		p_c = "\xF0\x9F\x95\x8F"
		clocks = n.times.map { convert_emoji_to_html(p_c.next!.dup) }
		clocks[n - 1].html_safe
	end

	def rating_gen(n = 0)
		<<~EOF
			<div class="rating-wrapper-all">
				<div class="rating-wrapper">
					<div class="rating-div" style="width: #{n.*(100)./(5).round}%"></div>
					#{image_tag 'stars.png', class: 'rating'}
				</div>
			</div>
		EOF
	end

	def items(title)
		Tag.where(title: title).shuffle.first(5)
	end

	def rs_tag(price)
		"&#x20B9; #{price.to_i.to_s.reverse.gsub(/\d{1,3}/).to_a.join(?,).reverse}.#{price.to_f.round(2).to_s.split(?.)[1].then { |x| x.length == 1 ? "#{x}0" : x }}".html_safe
	end
end
