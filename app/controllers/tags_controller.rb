class TagsController < ApplicationController
	before_action :set_tag, only: [:show]
	def show
	end


	private
	def set_tag
		@tags = Tag.where(title: params[:id])
		@lucky_items = @tags.sample(3)
	end
end
