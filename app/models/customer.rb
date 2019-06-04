class Customer < ApplicationRecord

  has_many :subscriptions
    
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :zip_code

end
