module CartItemsHelper
  # 購物車商品價格
  def render_product_price(product)
    if session[:currency].present? # 搜尋幣值數據
      @currency_s = session[:currency]
      @currency = Currency.find_by(name: @currency_s)
      product.price = product.price * @currency.rate
      price = @currency.symbol + " " + product.price.to_s
    else # 預設幣值為新台幣
      price = "$ " + product.price.to_s
    end
  end

  # 購物車商品小計（價格 x 數量）
  def render_product_price_count(product,quantity)
    if session[:currency].present? # 搜尋幣值數據
      @currency_s = session[:currency]
      @currency = Currency.find_by(name: @currency_s)
      count = @currency.symbol + " " + (product.price * quantity).to_s
    else # 預設幣值為新台幣
      count = "$ " + (product.price * quantity).to_s
    end
  end
end
