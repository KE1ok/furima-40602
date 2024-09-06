class Purchase < ApplicationRecord
  belongs_to :user
  has_one :area_datum
  has_one_attached :image
  belongs_to :item
end
