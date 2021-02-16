class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :status_id, :prefectures_id, :delivery_fee_id,
                                 :shipping_id, :image).merge(user_id: current_user.id)
  end
end
