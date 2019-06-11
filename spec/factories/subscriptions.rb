FactoryBot.define do
#:cc_cvv, :cc_expiration_date, :cc_billing_zip_code, :customer, :product
  factory :subscription do
    #cc_number {Faker::Number.number(16) }
    #cc_cvv {Faker::Number.number(3) }
    #cc_expiration_date {Faker::Date.forward(923) }
    #cc_billing_zip_code {Faker::Address.postcode }
    token {Faker::Number.number(31) }
    customer { association(:customer) }
    product { association(:product) }    
  end
end
