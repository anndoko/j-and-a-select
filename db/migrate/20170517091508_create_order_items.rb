class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :product_name
      t.integer :product_price
      t.integer :quantity
      t.timestamps
    end
  end
end
