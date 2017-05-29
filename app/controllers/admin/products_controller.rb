class Admin::ProductsController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!
  # 使用者必須是 admin 身份
  before_action :admin_required
  # 後台頁面排版
  layout "admin"

  def index
    @products = Product.all.recent.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @product = Product.find(params[:id])

    # 商品圖片
    @product_images = @product.product_images.all
  end

  def new
    @product = Product.new

    # 商品圖片
    @product_image = @product.product_images.build

    # 商品所屬的品牌/分類/顏色
    @brands = Brand.all
    @categories = Category.all.order("category_group_id, name")
    @colors = Color.all

  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if params[:product_images] != nil
        params[:product_images]['image'].each do |i|
          @product_image = @product.product_images.create(:image => i)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

    # 商品所屬的品牌/分類
    @brands = Brand.all
    @categories = Category.all.order("category_group_id, name")

  end

  def update
    @product = Product.find(params[:id])

    # 商品圖片
    if params[:product_images] != nil
      #刪除舊圖
      @product.product_images.destroy_all

      params[:product_images]['image'].each do |i|
        @product_image = @product.product_images.create(:image => i)
      end
      @product.update(product_params)

    elsif @product.update(product_params)
      redirect_to admin_products_path and return
    else
      render :edit

    end

    # 商品所屬的品牌
    @brands = Brand.all.map { |b| [b.name, b.id] }
    @product.brand_id = params[:brand_id]
    # 產品所屬的分類
    @categories = Category.all.map { |c| [c.name, c.id] }
    @product.category_id = params[:category_id]

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  # 發佈
  def publish
    @product = Product.find(params[:id])
    @product.publish!
    redirect_to :back
  end

  # 隱藏
  def hide
    @product = Product.find(params[:id])
    @product.hide!
    redirect_to :back
  end

  # 精選商品
  def chosen
    @product = Product.find(params[:id])
    if @product.is_chosen == true
      @product.no_chosen!
    else
      @product.chosen!
    end

    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :category_id, :brand_id, :size, :material, :country, :is_hidden, :is_chosen, color_ids: [])
  end

end
