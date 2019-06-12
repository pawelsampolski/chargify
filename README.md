# README


Things you may want to cover:

* Ruby version <br />
  `ruby 2.6.3p62`
  
* Database creation <br/>
  `rake db:create`
  
* Database initialization <br/>
`rake db:seed`
`rake db:migrate`
  
* How to run the test suite <br/>
 `rake spec`
  
* Services (job queues, cache servers, search engines, etc.)
 TODO
 
* Example (use httpie)
  * Products list <br />
  `http GET :3000/products`
  
  * Show product (for product_id =1 ) <br />
  ``http GET :3000/products/1``
  
  * Create customer <br/>
  `http POST :3000/customers name="customer1" address="street" zip_code="34456"`

  * Customer list <br/>
  `http GET :3000/customers`

  * Create subscription (for costomer_id=1, product_id=2) <br/>
  `http  POST :3000/customers/1/subscriptions cc_cvv="123" cc_expiration_date="Mon, 01 Jan 2020" cc_billing_zip_code="41923" product_id=2 cc_number="12312323123"`

  * List subscriptions (for cuntomer_id = 1) <br/>
  `http GET :3000/customers/1/subscriptions`