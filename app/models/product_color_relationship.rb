class ProductColorRelationship < ApplicationRecord
  # 關聯 #
  belongs_to :product
  belongs_to :color
end
