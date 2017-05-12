class Category < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: true

  # 關聯 #
  belongs_to :category_group
  has_many :products
end
