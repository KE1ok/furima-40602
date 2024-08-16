class ItemsController < ApplicationController
  def index
    @items = item.order("created_at DESC")
  end

  def new
    @item = item.new
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :image, :title, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
end
