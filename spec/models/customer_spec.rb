require 'rails_helper'

RSpec.describe Customer, type: :model do

  it { should have_many(:subscriptions) }
  
  # validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:zip_code) } 

end
