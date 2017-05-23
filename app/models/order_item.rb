class OrderItem < ApplicationRecord
  # 關聯 #
  belongs_to :order
  belongs_to :product
end
