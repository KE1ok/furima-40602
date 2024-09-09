FactoryBot.define do
  factory :purchase_area_datum do
    postal_code { '123-4567' }
    prefecture { 2 }
    municipalities { '東京都' }
    street { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09011112222' }
  end

end