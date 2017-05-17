class AddDetailsToGroupsAndCategories < ActiveRecord::Migration[5.0]
  def change
    # 修改  category_groups，新增 logo, description
    add_column :category_groups, :logo, :string
    add_column :category_groups, :description, :text

    # 修改 categories，新增 logo, description
    add_column :categories, :logo, :string
    add_column :categories, :description, :text
  end
end
