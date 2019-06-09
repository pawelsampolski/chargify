require 'rails_helper'

RSpec.describe 'Subscriptions API', type: :request do

 # Initialize the test data
  let!(:customer) { create(:customer) }
  let!(:subscriptions) { create_list(:subscription, 20, customer_id: customer.id) }
  let(:customer_id) { customer.id }
  let(:id) { customers.first.id }
    
  # Test suite for GET /customers/:customer_id/subscriptions
  describe 'GET /customers/:customer_id/subscriptions' do
    before { get "/customers/#{customer_id}/subscriptions" }

    context 'when subscription exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end

   context 'when subscription does not exist' do
      let(:subscription_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
   end
   
end
