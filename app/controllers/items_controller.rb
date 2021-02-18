class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :access_check, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :status_id, :prefectures_id, :delivery_fee_id,
                                 :shipping_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def access_check
    item = Item.find(params[:id])
    if current_user.id != item.user_id
      redirect_to root_path
    elsif Order.exists?(item_id: item.id)
      redirect_to root_path
    end
  end
end
