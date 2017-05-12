Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #--=== 後台 ===-->
  namespace :admin do
    # 品牌
    resources :brands
    # 分類
    resources :categories
    # 商品
    resources :products
  end

  #--=== 首頁 ===-->
  root 'welcome#index'


end
