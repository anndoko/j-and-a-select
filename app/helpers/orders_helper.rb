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

  # 訂單狀態
  def render_order_status(order)
    case order.aasm_state
    when 'order_placed'
      t('order-status-placed')
    when 'paid'
      t('order-status-paid')
    when 'shipping'
      t('order-status-shipping')
    when 'shipped'
      t('order-status-shipped')
    when 'order_cancelled'
      t('order-status-cancelled')
    when 'good_returned'
      t('order-status-returned')
    end
  end

  # 訂單狀態（管理者）
  def render_admin_order_status(order)
    case order.aasm_state
    when 'order_placed'
      t('order-status-placed-a')
    when 'paid'
      t('order-status-paid-a')
    when 'shipping'
      t('order-status-shipping')
    when 'shipped'
      t('order-status-shipped')
    when 'order_cancelled'
      t('order-status-cancelled')
    when 'good_returned'
      t('order-status-returned')
    end
  end
end
