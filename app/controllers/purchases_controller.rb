class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_area_datum = PurchaseAreaDatum.new
  end

  def create
    @purchase_area_datum = PurchaseAreaDatum.new(purchase_params)
    if @purchase_area_datum.valid?
      @purchase_area_datum.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_area_datum).permit(:postal_code, :prefecture, :municipalities, :street, :building_name, :telephone)
  end

end
