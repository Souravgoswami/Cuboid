class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy, :reviews, :add_to_line_items, :checkout, :add_to_wishlist]

	before_action :authenticate_user!, except: [:index, :show]

	# GET /products
	# GET /products.json
	def index
		@products = Product.page(params[:page]).per(5)
		# ('created_at desc').page(5)
	end

	# GET /products/1
	# GET /products/1.json
	def show
		@ratings = @product.reviews
		@n_ratings = @ratings.count
		@ratings_avg = @ratings.map(&:rating).sum / @n_ratings
	end

	def reviews
	end

	def checkout
		@ratings = @product.reviews
		@n_ratings = @ratings.count
		@ratings_avg = @ratings.map(&:rating).sum / @n_ratings
	end

	# GET /products/1
	def add_to_line_items
		@line_item = LineItem.new(user_id: current_user.id, product_id: @product.id)

		respond_to do |format|
			if @line_item.save
				format.js
			else
				format.js { render 'failed_saving_cart_item' }
			end
		end
	end

	def add_to_wishlist
		if Wishlist.where(product_id: @product.id).empty?
			@wishlist = Wishlist.new(user_id: current_user.id, product_id: @product.id)

			respond_to do |format|
				if @wishlist.save
					format.js
				else
					format.js { render 'failed_adding_wishlist' }
				end
			end
		else
			respond_to do |format|
				format.js { render 'already_added_to_wishlist' }
			end
		end
	end

	# GET /products/new
	def new
		@product = Product.new
		@product.previews.build
		@product
	end

	# GET /products/1/edit
	def edit
	end

	# POST /products
	# POST /products.json
	def create
		@product = Product.new(product_params)

		respond_to do |format|
			if @product.save
				format.html { redirect_to @product, notice: 'Product was successfully created.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /products/1
	# PATCH/PUT /products/1.json
	def update
		respond_to do |format|
			if @product.update(product_params)
				format.html { redirect_to @product, notice: 'Product was successfully updated.' }
				format.json { render :show, status: :ok, location: @product }
			else
				format.html { render :edit }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /products/1
	# DELETE /products/1.json
	def destroy
		@product.destroy
		respond_to do |format|
			format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_product
			@product = Product.find(params[:id])
		end


		# Only allow a list of trusted parameters through.
		def product_params
			params.require(:product).permit(
				:title, :description, :price,
				:features, :main_image, :thumbnail,
				previews_attributes: [:id, :image],
				reviews_attributes: [:id, :comment, :rating]
			)
		end
end
