FactoryBot.define do
  factory :user do
  name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    last_kana { 'ヤマダ' }
    first_kana { 'リクタロウ' }
    birthday { Faker::Date.birthday }
  end
end