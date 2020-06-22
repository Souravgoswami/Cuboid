module LineItemsHelper
	def user_top_suggested_tags(n = 3)
		current_user.combine_items.map { |x| x[0].tags.map(&:title) }.flatten.tally
		.sort_by { |x| x[1] }.tap(&:reverse!).map!(&:first).first(n)
		.map! do |x|
			Tag.where(title: x).map(&:product_id).tap(&:uniq!)
			.map! { |y| Product.find(y) unless current_user.includes?(y) }.tap(&:compact!)
		end.reject(&:empty?).tap(&:flatten!).first(5)
	end
end
