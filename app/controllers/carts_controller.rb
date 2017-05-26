class CartsController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!

  def index
    @carts = Cart.all

    # 隨機推薦 3 項商品
    @suggests = Product.published.random3

    # 商品類型 / 品牌
    @category_groups = CategoryGroup.published
    @brands = Brand.published
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
