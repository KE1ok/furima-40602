class PurchaseAreaDatum
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :image, :postal_code, :prefecture, :municipalities, :street, :building_name, :telephone

  with_options presence: true do
    validates :item
    validates :user
    validates :postal_code
    validates :prefecture
    validates :municipalities
    validates :street
    validates :telephone
  end

  validate :image_attached
end