class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_group_id
      t.boolean :is_hidden, default: false
      t.timestamps
    end
  end
end
