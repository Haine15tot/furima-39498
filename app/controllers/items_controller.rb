class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # Add any additional logic or instance variables you need for the new action here.
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :items_name, :item_text, :category_id, :condition_id, :send_id, :prefecture_id, :delivery_id, :plice)
  end
end