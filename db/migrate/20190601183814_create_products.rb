class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, :precision => 10, :scale => 10
      t.string :period, :default => "month"
      t.integer :amount_periods, :default =>1
      t.timestamps
    end
  end
end
