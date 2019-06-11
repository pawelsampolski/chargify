class FakepayService

  attr_reader :product_id, :customer_id
  
  def initialize(cc_number, cc_cvv, cc_expiration_date, cc_billing_zip_code, product_id, customer_id)
    @cc_number = cc_number
    @cc_cvv = cc_cvv
    @cc_expiration_date = cc_expiration_date
    @cc_billing_zip_code = cc_billing_zip_code
    @amount = Product.find(product_id).price
    @product_id = product_id
    @customer_id = customer_id  
  end

  def do_payment

    fakepay = Fakepay::Connection.new(@cc_number, @cc_cvv, @cc_expiration_date, @cc_billing_zip_code, @amount)
    response = fakepay.send_request

    if response['success']
      { subscription: create_subscription(response['token']) }
    else
      { code: response['error_code'] }
    end
  end

  private

  def create_subscription(token)

    subscription = Subscription.new(
      product_id: product_id,
      customer_id: customer_id,
      token: token 
    )
    
    subscription.save
    subscription
  end
end
