FactoryBot.define do
  factory :purchase_area_datum do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    street { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09011112222' }
    price { '5000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end

end