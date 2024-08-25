class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :title,     presence: true
  validates :price,     presence: true, numericality: { 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999, 
    only_integer: true,
    message: "must be an integer between 300 and 9,999,999" 
  }

  validate :image_attached

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  private

  def image_attached
    if image.blank?
      errors.add(:image, "を添付してください")
    end
  end

end
