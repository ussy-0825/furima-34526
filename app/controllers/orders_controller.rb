class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_item_owner, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_delivery = Orderdelivery.new
  end

  def create
    @order_delivery = Orderdelivery.new(order_params)
    if @order_delivery.valid?
      buy_item
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:orderdelivery).permit(:postal_code, :prefectures_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def buy_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(order_params[:item_id]).price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def move_item_owner
    item_owner = Item.find(params[:item_id])
    if current_user.id == item_owner.user_id
      redirect_to root_path
    elsif Order.exists?(item_id: item_owner.id)
      redirect_to root_path
    end
  end

end
