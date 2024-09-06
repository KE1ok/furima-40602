class PurchaseAreaDatum
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture, :municipalities, :street, :building_name, :telephone


  with_options presence: true do
    validates :postal_code
    validates :prefecture
    validates :municipalities
    validates :street
    validates :telephone
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    AreaDatum.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, street: street, building_name: building_name, telephone: telephone, purchase_id: purchase.id)
  end
end