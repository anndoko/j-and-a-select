class CreateWishLists < ActiveRecord::Migration[5.0]
  def change
    create_table :wish_lists do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
