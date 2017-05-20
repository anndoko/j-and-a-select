class Admin::BrandsController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!
  # 使用者必須是 admin 身份
  before_action :admin_required
  # 後台頁面排版
  layout "admin"

  def index
    @brands = Brand.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to admin_brands_path
    else
      render :new
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      redirect_to admin_brands_path
    else
      render :edit
    end
  end

  # 發佈
  def publish
    @brand = Brand.find(params[:id])
    @brand.publish!
    redirect_to :back
  end

  # 隱藏
  def hide
    @brand = Brand.find(params[:id])
    @brand.hide!
    redirect_to :back
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :logo, :is_hidden)
  end

end
