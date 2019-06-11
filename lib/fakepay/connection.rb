module Fakepay
  require "net/http"
  require "uri"
  
  class Connection
    attr_reader :cc_number, :cc_cvv, :cc_expiration_date, :cc_billing_zip_code, :amount, :uri

    def initialize(cc_number, cc_cvv, cc_expiration_date, cc_billing_zip_code, amount)
      @cc_number = cc_number
      @cc_cvv = cc_cvv
      @cc_expiration_date = cc_expiration_date
      @cc_billing_zip_code = cc_billing_zip_code
      @amount = amount
      @uri = URI.parse('https://www.fakepay.io/purchase')
      @token = 'a4aab4c97b2144fd4b8fe148bd7b81'
    end

    def send_request
      response = http_object.request(post_request)
      res = JSON.parse(response.body)
      res
    end

    private

    def http_object
      Net::HTTP.new(uri.host, uri.port).tap do |http|
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    def post_request
      Net::HTTP::Post.new(uri.request_uri, headers).tap do |req|
        req.body = json_body
      end
    end

    def headers
      {
        'Authorization' => "Token token=#{@token}",
        'Content-Type' => 'application/json'
      }
    end
    
    def json_body
      {
        amount: amount,
        card_number: cc_number,
        cvv: cc_cvv,
        expiration_month: Date.parse(cc_expiration_date).month.to_s,
        expiration_year: Date.parse(cc_expiration_date).year.to_s, 
        zip_code: cc_billing_zip_code
      }.to_json
    end
  end
end
