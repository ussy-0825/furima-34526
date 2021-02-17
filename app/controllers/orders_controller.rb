class OrdersController < ApplicationController

  def index
    @item = Item.find(item_params[:item_id])
  end

  def create
    @order_delivery = Orderdelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def item_params
    params.permit(:item_id)
  end

  def order_params
    params.permit(:postal_code, :prefectures_id, :city, :address, :building, :phone, :item_id).merge(user_id: current_user.id)
  end

end
