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

      it 'returns all customer subscriptions' do
        expect(json.size).to eq(20)
      end
      
    end

    context 'when customer does not exist' do
      let(:customer_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end

  # Test suite for PUT /customer/:customer_id/subscriptions
  describe 'POST /customer/:customer_id/subscriptions' do
    let(:valid_attributes) { {cc_number:"4242424242424242", cc_cvv: "123", cc_expiration_date: "Mon, 01 Jan 2020", cc_billing_zip_code: "41923", product_id: 1 } }

    context 'when request attributes are valid' do
      before { post "/customers/#{customer_id}/subscriptions", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
  
end
