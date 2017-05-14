class ApplicationController < ActionController::Base

  # 檢查使用者身份
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: t('warning-not-admin')
    end
  end

  # 購物車相關
  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

end
