class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else      
      Rails.logger.info @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_explain, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price)
  end
end
