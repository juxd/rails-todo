class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(items_params)

		if @item.save
			redirect_to :action => 'index'
		else
			render 'new'
		end
	end

	private
		def items_params
			params.require(:item).permit(:task, :due)
		end
end
