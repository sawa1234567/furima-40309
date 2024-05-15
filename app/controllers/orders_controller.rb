class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    #gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
  @order_form = OrderForm.new(order_params)
  if @order_form.valid?
     pay_item
     @order_form.save
     redirect_to root_path
  else
    #gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render:index
  end
end

  private
  def order_params
    params.require(:order_form).permit(:post_code,:prefecture_id,:municipality,:address,:build,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key ="sk_test_d84ce1c9207afacdf5b01a12"
    Payjp::Charge.create(
      amount: @item.price,           
      card: order_params[:token],   
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end  
end
