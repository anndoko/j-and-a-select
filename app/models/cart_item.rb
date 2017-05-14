class CartItem < ApplicationRecord
  # 關聯 #
  belongs_to :cart
  belongs_to :product

end
