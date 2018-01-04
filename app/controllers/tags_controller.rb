class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
		@items = Item.where({tag_id: params[:id]})
	end

	def new
		@tag = Tag.new
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def create
		@tag = Tag.new(params.require(:tag).permit(:tag))

		if @tag.save
			redirect_to tags_path
		else
			render 'new'
		end
	end

	def update
		@tag = Tag.find(params[:id])

		if @tag.update(params.require(:tag).permit(:tag))
			redirect_to tags_path
		else
			render 'new'
		end
	end

end
