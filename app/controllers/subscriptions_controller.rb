class SubscriptionsController < ApplicationController

  helper FakepayHelper

  before_action :set_customer
  before_action :set_customer_subscription, only: [:show, :update, :destroy]
  before_action :set_customer_subscription_poduct, only: [:create, :show, :update, :destroy]

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

    begin
      token = FakepayService.do_payment(@product.price, params[:cc_number], params[:cc_cvv], params[:cc_expiration_date], params[:cc_billing_zip_code])
      #token = FakepayService.renewal_payment(@product.price, '7b844afa62e95d8117254855cffadc')
    rescue Exception => e
      return json_response('payment_error' => FakepayHelper.error_message(1000001))
    end

    @subscription = Subscription.new(
        product_id: @product.id,
        customer_id: @customer.id,
        token: token,
        active: true,
        subscribe_date: Time.now,
        expiration_date: Time.now + (@product.amount_periods).send((@product.period.downcase).to_sym)
    )
    @subscription.save
    json_response(@subscription, :created)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:product_id)
  end

  def cc_params
    params.permit(:cc_number, :cc_cvv, :cc_expiration_date, :cc_billing_zip_code, :product_id)
  end

  def set_customer_subscription_poduct
    @product = Product.find(params[:product_id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_subscription
    @subscription = @customer.subscriptions.find_by!(id: params[:id]) if @subscription
  end

end
