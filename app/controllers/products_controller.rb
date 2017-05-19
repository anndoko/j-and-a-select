class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_wish_list, :remove_from_wish_list]

  def index
    # 商品類型 / 品牌
    @category_groups = CategoryGroup.published
    @brands = Brand.published

    # 判斷是否篩選分類
    if params[:category].present?
      @category_s = params[:category]
      @category = Category.find_by(name: @category_s)

      @products = Product.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 判斷是否篩選類型
    elsif params[:group].present?
      @group_s = params[:group]
      @group = CategoryGroup.find_by(name: @group_s)

      @products = Product.joins(:category).where("categories.category_group_id" => @group.id).paginate(:page => params[:page], :per_page => 12)

    # 判斷是否篩選品牌
    elsif params[:brand].present?
      @brand_s = params[:brand]
      @brand_id = Brand.find_by(name: @brand_s)

      @products = Product.where(:brand => @brand_id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 預設顯示所有公開商品
    else
      @products = Product.published.recent.paginate(:page => params[:page], :per_page => 12)
    end

  end

  def show
    @product = Product.find(params[:id])
    @product_images = @product.product_images.all
    # 類型 / 品牌 / 幣值
    @category_groups = CategoryGroup.published
    @brands = Brand.published
    @currencies = Currency.all

    # 幣值切換
    if params[:currency].present?
      @currency_s = params[:currency]
      @currency = Currency.find_by(name: @currency_s)
      @product.price = @product.price * @currency.rate
    else
      @product.price = @product.price * 1
    end
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

  # 將該商品加入願望清單
  def add_to_wish_list
    @product = Product.find(params[:id])
    if !current_user.is_wish_list_owner_of?(@product)
      current_user.add_to_wish_list!(@product)
    end

    redirect_to :back
  end

  # 從願望清單上刪除該商品
  def remove_from_wish_list
    @product = Product.find(params[:id])
    if current_user.is_wish_list_owner_of?(@product)
      current_user.remove_from_wish_list!(@product)
    end

    redirect_to :back
  end


end
