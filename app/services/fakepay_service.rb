class FakepayService

  def self.do_payment(amount, cc_number, cc_cvv, cc_expiration_date, cc_billing_zip_code)
    FakepayService.success(Fakepay::Connection.new(FakepayService.create_payment_json_body(amount, cc_number, cc_cvv, cc_expiration_date, cc_billing_zip_code)).send_request)
  end

  def self.renewal_payment(amount, token)
    FakepayService.success(Fakepay::Connection.new(FakepayService.renewal_payment_json_body(amount, token)).send_request)
  end

  private

  def self.success(response)
    raise response['error_code'].to_s unless response['success']
    response['token']
  end

  def self.create_payment_json_body (amount, cc_number, cc_cvv, cc_expiration_date, cc_billing_zip_code)
    {
        amount: amount,
        card_number: cc_number,
        cvv: cc_cvv,
        expiration_month: Date.parse(cc_expiration_date).month.to_s,
        expiration_year: Date.parse(cc_expiration_date).year.to_s,
        zip_code: cc_billing_zip_code
    }.to_json
  end

  def self.renewal_payment_json_body (amount, token)
    {
        amount: amount,
        token: token,
    }.to_json
  end

end
