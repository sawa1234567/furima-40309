class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_explain, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :Shipping_date_id, :price)
  end
end
