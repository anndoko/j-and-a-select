class Admin::OrdersController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!
  # 使用者必須是 admin 身份
  before_action :admin_required
  # 後台頁面排版
  layout "admin"

  def index
    @orders = Order.order('id DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
end
