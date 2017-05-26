class Color < ApplicationRecord
  # 關聯 #
  has_many :product_color_relationships
  has_many :colored_products, :through => :product_color_relationships, :source => :product

  # 商品是否屬於該顏色
  def is_color_of?(product)
    colored_products.include?(product)
  end
end
