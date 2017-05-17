class Order < ApplicationRecord

  # 新增/修改欄位限制與提示 #
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  # 關聯 #
  belongs_to :user

end
