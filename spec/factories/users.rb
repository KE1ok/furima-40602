FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸太郎'}
    last_ruby             {'ヤマダ'}
    first_ruby            {'リクタロウ'}
    birthday              {Faker::Date.birthday}
  end
end