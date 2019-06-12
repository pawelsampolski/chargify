class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :token
      t.boolean :active
      t.date :subscribe_date
      t.date :expiration_date
      t.references :customer, foregin_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
