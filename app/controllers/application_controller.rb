class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_currency

  #設定多國語系
  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  #設定幣值
  def set_currency
    if params[:currency]
      session[:currency] = params[:currency]
    end
  end

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
