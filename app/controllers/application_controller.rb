class ApplicationController < ActionController::Base

  # 檢查使用者身份
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: t('warning-not-admin')
    end
  end
  
end
