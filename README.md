# README


Things you may want to cover:

* Ruby version
  ruby 2.6.3p62
  
* Database creation
- `rake db:create`
  
* Database initialization
- `rake db:seed`
- `rake db:migrate`
  
* How to run the test suite
- `rake spec`
  
* Services (job queues, cache servers, search engines, etc.)
 TODO
 
* Example (use httpie)

  * Create ustomer
  - `http POST :3000/customers name="customer1" address="street" zip_code="34456"`

  * Customer list
  - `http GET :3000/customers`

  * Create subscription (for costomer_id=1, product_id=2)
  - `http  POST :3000/customers/1/subscriptions cc_cvv="123" cc_expiration_date="Mon, 01 Jan 2020" cc_billing_zip_code="41923" product_id=2 cc_number="12312323123"`

  * List subscriptions (for cuntomer_id = 1)
  - `http GET :3000/customers/1/subscriptions`