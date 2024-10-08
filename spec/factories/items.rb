FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.sentence }
    title              { Faker::Lorem.sentence }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id        { Faker::Number.between(from: 2, to: 48) }
    condition_id       { Faker::Number.between(from: 2, to: 48) }
    shipping_fee_id    { Faker::Number.between(from: 2, to: 48) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id   { Faker::Number.between(from: 2, to: 48) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
