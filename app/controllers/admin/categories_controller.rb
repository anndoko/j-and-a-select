class Admin::CategoriesController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!
  # 使用者必須是 admin 身份
  before_action :admin_required
  # 後台頁面排版
  layout "admin"

  def index
    @categories = Category.all
    @category_groups = CategoryGroup.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    # 所屬的大分類
    @category_groups = CategoryGroup.all
    # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
  end

  def create
    @category = Category.new(category_params)
    # 所屬的大分類
    # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
    # @category.category_group_id = params[:category_group_id]

    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    # 所屬的大分類
    @category_groups = CategoryGroup.all
    # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
  end

  def update
    @category = Category.find(params[:id])
    # 所屬的大分類
    # @category_groups = CategoryGroup.all.map { |g| [g.name, g.id] }
    # @category.category_group_id = params[:category_group_id]

    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  # 發佈
  def publish
    @category = Category.find(params[:id])
    @category.publish!
    redirect_to :back
  end

  # 隱藏
  def hide
    @category = Category.find(params[:id])
    @category.hide!
    redirect_to :back
  end

  private

  def category_params
    params.require(:category).permit(:name, :category_group_id, :is_hidden, :description, :logo)
  end

end
