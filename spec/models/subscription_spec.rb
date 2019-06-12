require 'rails_helper'

RSpec.describe Subscription, type: :model do
  
  # Association test
  it { should belong_to(:customer) }
  it { should belong_to(:product) }

  # Validation test
  it { should validate_presence_of(:token) }

end
