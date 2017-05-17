class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  # 清空購物車
  def clear
    current_cart.clear!
    flash[:warning] = t('message-clear-cart-success')
    redirect_to carts_path
  end

  # 下訂
  def checkout
    @order = Order.new
  end

end
