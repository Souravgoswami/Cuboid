class LineItemsController < ApplicationController
	include CurrentCart

	before_action :set_line_item, only: [:show, :edit, :update, :destroy]
	before_action :set_current_user, only: [:index]
	before_action :set_cart, only: [:create]

	# GET /line_items
	# GET /line_items.json
	def index
		@line_items = LineItem.where(user_id: current_user)

		@user_items = @line_items
			.map { |x| p [Product.find(x.product_id), x.quantity, x] }.group_by { |x| x[0] }
			.reduce( {} ) { |h, x| h.merge!({ x[0] => [ x[1].map { |y| y[1] }.sum, x[1].map(&:last) ] }) }
	end

	# GET /line_items/1
	# GET /line_items/1.json
	def show
	end

	def update_quantity
		# byebug
	end

	# GET /line_items/new
	def new
		@line_item = LineItem.new
	end

	# GET /line_items/1/edit
	def edit
	end

	# POST /line_items
	# POST /line_items.json
	def create
		@product = Product.find(params[:product_id])
		@line_item = @cart.add_product(@product)

		respond_to do |format|
			if @line_item.update(line_item_params)
				format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
				format.json { render :show, status: :ok, location: @line_item }
			else
				format.html { render :edit }
				format.json { render json: @line_item.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /line_items/1
	# PATCH/PUT /line_items/1.json
	def update
		respond_to do |format|
			if @line_item.update(line_item_params)
				format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
				format.json { render :show, status: :ok, location: @line_item }
			else
				format.html { render :edit }
				format.json { render json: @line_item.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /line_items/1
	# DELETE /line_items/1.json
	def destroy
		@line_item.destroy

		respond_to do |format|
			format.html { redirect_to line_items_url, notice: "Req ID: #{@line_item.id} removed." }
			format.json { head :no_content }
		end
	end

	def destroy_related
		fdask
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_line_item
			@line_item = LineItem.find(params[:id])
		end

		def set_current_user
			@user = defined?(current_user) ? current_user : GuestUser
		end

		# Only allow a list of trusted parameters through.
		def line_item_params
			params.require(:line_item).permit(:product_id, :cart_id)
		end
end
