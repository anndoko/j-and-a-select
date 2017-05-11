class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :quantity
      t.integer :category_id
      t.integer :brand_id
      t.boolean :is_hidden, default: true
      t.timestamps
    end
  end
end
