module CartsHelper
  # 計算購物車商品總價
  def render_cart_total_price(cart)
    cart.total_price
  end
end
