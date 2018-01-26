class TagsController < ApplicationController
  before_action :authorize

	def index
		@tags = Tag.order(:id)
     if params[:search]
      @tags = Tag.where("tag ILIKE ?", "%#{params[:search]}%").order(:id)
    else 
      @tags - Tag.order(:id)
    end
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

  def destroy
    @items = Item.where(tag_id: params[:id])
    @items.each do |item|
      item.update(tag_id: "0")
    end
		@tag = Tag.find(params[:id])
		@tag.destroy

		redirect_to tags_path
	end

end
