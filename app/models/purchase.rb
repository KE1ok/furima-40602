class Purchase < ApplicationRecord
  belongs_to :user
  has_one :area_datum
  belongs_to :item
end
