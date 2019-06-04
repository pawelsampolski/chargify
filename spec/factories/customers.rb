FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    address { Faker::Address.full_address }
    zip_code { Faker::Address.postcode }
  end
end
