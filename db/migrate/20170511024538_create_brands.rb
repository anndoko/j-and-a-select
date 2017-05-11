class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.boolean :is_hidden, default: false
      t.timestamps
    end
  end
end
