class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_wish_list, :remove_from_wish_list]
  before_action :validate_search_key, only: [:search]

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

      @products = Product.joins(:category).where("categories.category_group_id" => @group.id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 判斷是否篩選品牌
    elsif params[:brand].present?
      @brand_s = params[:brand]
      @brand = Brand.find_by(name: @brand_s)

      @products = Product.where(:brand => @brand.id).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 判斷是否選擇精選商品
    elsif params[:chosen].present?
      @products = Product.where(:is_chosen => true).published.recent.paginate(:page => params[:page], :per_page => 12)

    # 預設顯示所有公開商品
    else
      @products = Product.published.recent.paginate(:page => params[:page], :per_page => 12)
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_images = @product.product_images.all
    @orderSum = OrderItem.where("product_id" => @product.id).sum(:quantity)

    # 隨機推薦 3 項商品
    @suggests = Product.published.random3

    # 類型 / 品牌 / 幣值
    @category_groups = CategoryGroup.published
    @brands = Brand.published
    @currencies = Currency.all
  end

  # 設定幣值
  def setup_currency
    set_currency

    redirect_to :back
  end

  # 加入購物車
  def add_to_cart
    @product = Product.find(params[:id])
    @quantity = params[:quantity]

    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product,@quantity)
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

  def search
    if @query_string.present?
      # 顯示符合條件的商品
      search_result = Product.joins(:brand).ransack(@search_criteria).result(:distinct => true)
      @products = search_result.published.recent.paginate(:page => params[:page], :per_page => 12 )
    end

    @category_groups = CategoryGroup.published
    @brands = Brand.published
  end

  protected

  def validate_search_key
    # 去除特殊字符
    @query_string = params[:keyword].gsub(/\\|\'|\/|\?/, "") if params[:keyword].present?
    @search_criteria = search_criteria(@query_string)

  end

  def search_criteria(query_string)
    # 篩選多個欄位
    { :name_or_description_or_brand_name_cont => query_string }
  end

end
