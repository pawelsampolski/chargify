FactoryBot.define do
  factory :subscription do
    token {Faker::Number.number(31) }
    customer { association(:customer) }
    product { association(:product) }    
  end
end
