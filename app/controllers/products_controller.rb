class ProductsController < ApplicationController

  def index
    @products = Product.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end

  # 加入購物車
  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back, notice: t('message-add-to-cart-success')
  end

end
