class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :pay]

  # 產生訂單
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if session[:currency].present? # 搜尋幣值數據
      @currency_s = session[:currency]
    else # 預設幣值為新台幣
      @currency_s = '新台幣'
    end
    @currency = Currency.find_by(name: @currency_s)
    @order.currency = @currency.symbol

    if @order.save

      # 將購買車內容存入訂單
      current_cart.cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.order = @order
        order_item.product_id = cart_item.product_id # 存商品ID
        order_item.quantity = cart_item.quantity
        order_item.save
      end

      # 訂單成立後清空購物車
      current_cart.clear!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  # 訂單明細
  def show
    @order = Order.find_by_token(params[:id])
    @order_items = @order.order_items

    # 產生 PayPal 付款的 clientToken
    @client_token = Braintree::ClientToken.generate
  end

  # PayPal 付款
  def pay_with_paypal
    @order = Order.find_by_token(params[:id])

    if @order
      nonce = params[:payment_method_nonce]

      result = Braintree::Transaction.sale(
        amount: @order.total,
        payment_method_nonce: nonce
      )

      if result
        # 付款成功
        @order.make_payment!
        redirect_to order_path(@order.token)
      else
        # 錯誤處理
        flash[:notice] = t('message-payment-failed')
        render :pay_with_paypal
      end

    else
      # 錯誤處理
      flash[:notice] = t('message-payment-failed')
      render :pay_with_paypal
    end
  end

  # 申請取消訂單
  def apply_to_cancel
    @order = Order.find(params[:id])
    flash[:notice] = t('message-cancel-request-sent')
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :shipping_phone, :payment_method)
  end


end
