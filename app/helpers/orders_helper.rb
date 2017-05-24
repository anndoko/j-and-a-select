module OrdersHelper
  # 購物車商品價格
  def render_order_product_price(product)
    @currency_s = @order.currency
    @currency = Currency.find_by(symbol: @currency_s)
    product.price = product.price * @currency.rate
    @currency.symbol + " " + product.price.to_s
  end

  # 購物車商品小計（價格 x 數量）
  def render_order_product_price_count(product,quantity)
    @order.currency + " " + (product.price * quantity).to_s
  end
end
