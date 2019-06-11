class SubscriptionsController < ApplicationController
 
  before_action :set_customer
  before_action :set_customer_subscription, only: [:show, :update, :destroy]

  # GET /customers/:customer_id/subscriptions
  def index
    json_response(@customer.subscriptions, :ok, 'product')
  end

  # GET /customers/:customer_id/subscriptions/:id
  def show
    json_response(@subscription, :ok, "product")
  end

  # POST /customers/:subscription_id/subscriptions
  def create
    
    @subscription = FakepayService.new(
      cc_params[:cc_number], cc_params[:cc_cvv], cc_params[:cc_expiration_date], cc_params[:cc_billing_zip_code], cc_params[:product_id], @customer.id
    ).do_payment
    
    
    json_response(@subscription, :created)
  end
  
  private

  def subscription_params
    params.permit(:cc_number, :cc_cvv, :cc_expiration_date, :cc_billing_zip_code, :product_id, :customer_id, :subscription)
  end

  def cc_params
    params.permit(:cc_number, :cc_cvv, :cc_expiration_date, :cc_billing_zip_code, :product_id, :customer_id, :subscription)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_subscription
    @subscription = @customer.subscriptions.find_by!(id: params[:id]) if @subscription
  end
end
