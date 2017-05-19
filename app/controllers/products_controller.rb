class ProductsController < ApplicationController

  def index
    # 商品類型 / 品牌
    @category_groups = CategoryGroup.published
    @brands = Brand.published

    # 判斷是否篩選分類
    if params[:category].present?
      @category = params[:category]
      @category_id = Category.find_by(name: @category)

      @products = Product.where(:category => @category_id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 判斷是否篩選品牌
    elsif params[:brand].present?
      @brand = params[:brand]
      @brand_id = Brand.find_by(name: @brand)

      @products = Product.where(:brand => @brand_id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 預設顯示所有公開商品
    else
      @products = Product.published.recent.paginate(:page => params[:page], :per_page => 12)
    end

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
