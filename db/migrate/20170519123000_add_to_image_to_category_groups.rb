class AddToImageToCategoryGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :category_groups, :image, :string
  end
end
