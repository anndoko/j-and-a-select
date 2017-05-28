class CreateProductColorRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :product_color_relationships do |t|
      t.integer :product_id
      t.integer :color_id
      t.timestamps
    end
  end
end
