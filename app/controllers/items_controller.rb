class ItemsController < ApplicationController
	before_action :authorize

  def index
		@items = Item.where(user_id: session[:user_id]).order(:id)
    if params[:search]
      @items = Item.where("task ILIKE ?", "%#{params[:search]}%").order(:id)
    else 
      @items - Item.order(:id)
    end
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
    @item.user_id = session[:user_id]
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
  
  #Defining a new method to update status of task
  def mark_as_done
    @item = Item.find(params[:id])
    @item.update(status: "Complete")
 
    redirect_to items_path
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
