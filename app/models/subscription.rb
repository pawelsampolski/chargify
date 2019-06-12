class Subscription < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product

  validates_presence_of :token

  def renewal!

  end

end
