class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      # cc - (c)redit (c)ard
      t.integer :cc_cvv, :limit => 3
      t.date :cc_expiration_date
      t.string :cc_billing_zip_code
      t.references :customer, foregin_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
