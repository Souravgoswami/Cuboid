class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################


	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	validates_presence_of :name

	has_many :products
	has_many :reviews
	has_many :purchases
	has_many :wishlists
	has_many :line_item

	def first_name
		self.name.to_s.split(' ')[0].to_s.capitalize
	end

	def last_name
		self.name.to_s.split(' ')[-1].to_s.capitalize
	end

	def includes?(product_id)
		combine_items.include?(Product.find(product_id))
	end

	def combine_items
		self.line_item.group_by { |x| x[:product_id] }.reduce( {} ) do |y, x|
			y.merge(Product.find(x[0]) => x[1].map { |y| y[:quantity] }.sum)
		end
	end

	alias :line_items :combine_items
end
