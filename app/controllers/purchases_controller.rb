class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new
    @purchase = Purchase.create(purchase_params)
    AreaDatum.create(area_datum_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def area_datum_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :street, :building_name, :telephone).merge(purchase_id: @purchase.id)
  end
end
