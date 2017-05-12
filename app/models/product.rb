class Product < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal: 0 }
  validates :category_id, presence: true
  validates :brand_id, presence: true

  # 關聯 #
  belongs_to :category
  belongs_to :brand
end
