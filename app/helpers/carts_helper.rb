module CartsHelper
  # 計算購物車商品總價
  def render_cart_total_price(cart)
    if session[:currency].present? # 搜尋幣值數據
      @currency_s = session[:currency]
      @currency = Currency.find_by(name: @currency_s)
      @currency.symbol + " " + cart.total_price.to_s
    else # 預設幣值為新台幣
      "$ " + cart.total_price.to_s
    end
  end
end
