require 'rails_helper'

RSpec.describe Subscription, type: :model do
  
  # Association test
  it { should belong_to(:customer) }
  it { should belong_to(:product) }

  # Validation test
  it { should validate_presence_of(:cc_cvv) }
  it { should validate_presence_of(:cc_expiration_date) }
  it { should validate_presence_of(:cc_billing_zip_code) } 

end
