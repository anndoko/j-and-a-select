class Color < ApplicationRecord
  # 關聯 #
  has_many :product_color_relationships
  has_many :colored_products, :through => :product_color_relationships, :source => :product
end
