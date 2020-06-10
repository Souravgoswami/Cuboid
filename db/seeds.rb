# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'a@a.a', password: 'aaaaaa', name: 'a')

10.times do |x|
	fname = "User#{x + 1}"
	lname = rand(4..8).times.map { rand(97..122).chr }.join

	u = User.create!(
		email: "#{fname.downcase}@#{rand(3..6).times.map { rand(97..122).chr }.join}.#{%w(com org net io me).sample}",
		password: x.to_s.*(6)[0..5],
		name: "#{fname} #{lname}"
	)

	p = Product.create!(
		title: rand(5..15).times.map { rand(97..122).chr }.join.capitalize,
		description: rand(50..150).times.map { rand(97..122).chr }.join.capitalize,
		price: rand(5000.0..50000.0),
		features: rand(10..50).times.map { rand(97..122).chr }.join.capitalize
	)

	rand(1..5).times do |x|
		Review.create!(
			product_id: p.id, user_id: u.id,
			comment: rand(5..15).times.map { rand(97..122).chr }.join.capitalize,
			rating: rand(1.0..5.0)
		)

		# Preview.create!(
		# 	product_id: p.id,
		# 	image: rand(5..15).times.map { rand(97..122).chr }.join.capitalize,
		# )
	end

	print "\e[2K#{x + 1}\r"
end

100.times do |x|
end
