class Product < ApplicationRecord

  has_many :subscriptions
  
  validates_presence_of :title
  validates_presence_of :price
  
end
