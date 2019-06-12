module Fakepay
  require "net/http"
  require "uri"
  
  class Connection

    URI = URI.parse('https://www.fakepay.io/purchase')

    def initialize(body)
      @body = body
      @token =  ENV['FAKEPAY_API_KEY']
      @token = 'a4aab4c97b2144fd4b8fe148bd7b81'
    end

    def send_request
      response = http_object.request(post_request)
      JSON.parse(response.body)
    end

    private

    def http_object
      Net::HTTP.new(URI.host, URI.port).tap do |http|
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    def post_request
      Net::HTTP::Post.new(URI.request_uri, headers).tap do |req|
        req.body = @body
      end
    end

    def headers
      {
        'Authorization' => "Token token=#{@token}",
        'Content-Type' => 'application/json'
      }
    end

  end
end
