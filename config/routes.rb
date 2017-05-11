Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #--=== 後台 ===-->
  namespace :admin do
    # 品牌
    resources :brands
  end

  #--=== 首頁 ===-->
  root 'welcome#index'


end
