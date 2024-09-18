class PurchaseAreaDatum
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :street, :building_name, :telephone, :token, :price


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は3桁-4桁のハイフンを含む半角数字で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :street
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "can't be blank" }
    validates :token
    validates :price
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    AreaDatum.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, street: street, building_name: building_name, telephone: telephone, purchase_id: purchase.id)
  end
end