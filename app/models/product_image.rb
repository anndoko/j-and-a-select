class ProductImage < ApplicationRecord
  # 關聯 #
  belongs_to :product

  # 商品圖片 #
  mount_uploader :image, ImageUploader
end
