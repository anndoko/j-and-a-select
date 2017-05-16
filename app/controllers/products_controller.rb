class ProductsController < ApplicationController

  def index
    @products = Product.published.paginate(:page => params[:page], :per_page => 12)
    # 商品所屬的品牌/分類
    @category_groups = CategoryGroup.published
    @brands = Brand.published
  end

  def show
    @product = Product.find(params[:id])
    # 商品圖片
    @product_images = @product.product_images.all
    # 商品所屬的品牌/分類
    @category_groups = CategoryGroup.published
    @brands = Brand.published
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
