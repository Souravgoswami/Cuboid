# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'a@a.a', password: 'aaaaaa', name: 'a')

100.times do |x|
	fname = "User#{x + 1}"
	lname = rand(4..8).times.map { rand(97..122).chr }.join

	User.create!(
		email: "#{fname.downcase}@#{rand(3..6).times.map { rand(97..122).chr }.join}.#{%w(com org net io me).sample}",
		password: x.to_s.*(6)[0..5],
		name: "#{fname} #{lname}"
	)

	print "\e[2K#{x + 1}\r"
end
