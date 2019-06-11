class Subscription < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product

  validates_presence_of :token
  #validates_presence_of :cc_cvv
  #validates_presence_of :cc_expiration_date
  #validates_presence_of :cc_billing_zip_code

end
