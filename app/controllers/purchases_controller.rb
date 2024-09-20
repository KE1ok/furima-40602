class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user_id != current_user.id && @item.purchase.nil?
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @purchase_area_datum = PurchaseAreaDatum.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_area_datum = PurchaseAreaDatum.new(purchase_params)
    if @purchase_area_datum.valid?
      pay_item
      @purchase_area_datum.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_area_datum).permit(:postal_code, :prefecture_id, :municipalities, :street, :building_name, :telephone).merge(
      token: params[:token], price: @item.price, item_id: params[:item_id], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
