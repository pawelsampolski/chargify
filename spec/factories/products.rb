FactoryBot.define do
  factory :product do
    title {Faker::Lorem.word}
    price {Faker::Number.number(4)}
    period {'Month'}
    amount_periods { 1 }
  end
end
