class WishList < ApplicationRecord
  # 關聯 #
  belongs_to :product
  belongs_to :user
end
