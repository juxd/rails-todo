class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(items_params)
		@item.status = "Incomplete"

		if @item.save
			redirect_to items_path
		else
			render 'new'
		end
	end

	def update
		@item = Item.find(params[:id])

		if @item.update(items_params)
      redirect_to items_path
    else
      render 'edit'
    end
  end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		redirect_to items_path
	end

	private
		def items_params
			params.require(:item).permit(:task, :due, :tag_id)
		end
end
