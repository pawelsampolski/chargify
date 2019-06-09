FactoryBot.define do
# :title  :price, :period :amount_periods      

  factory :product do
    title {Faker::Lorem.word}
    price {Faker::Number.number(4)}
    period {'Month'}
    amount_periods { 1 }      
    #cc_cvv {Faker::Number.number(3) }
    #cc_expiration_date {Faker::Date.forward(923) }
    #cc_billing_zip_code {Faker::Address.postcode }
    #customer { association(:customer) }
    #product { association(:product) }
    
  end
end
