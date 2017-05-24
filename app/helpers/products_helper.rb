module ProductsHelper
  # 幣值切換
  def render_product_price(product)
    if session[:currency].present?
      @currency_s = session[:currency]
      @currency = Currency.find_by(name: @currency_s)
      product.price = product.price * @currency.rate
      price = @currency.symbol + " " + product.price.to_s
    else # 預設幣值為新台幣
      price = "$ " + product.price.to_s
    end
  end
end
