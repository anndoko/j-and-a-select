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

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    redirect_to :back
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end

end
