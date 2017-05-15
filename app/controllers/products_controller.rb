class ProductsController < ApplicationController

  def index
    @products = Product.where(:is_hidden => false)
    @category_groups = CategoryGroup.all
    @brands = Brand.all
  end

  def show
    @product = Product.find(params[:id])
  end

  # 加入購物車
  def add_to_cart

    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = t('message-add-to-cart-success')
    else
      flash[:warning] = t('message-already-added')
    end

    redirect_to :back
  end

end
