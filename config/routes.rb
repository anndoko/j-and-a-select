Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #--=== 首頁 ===--#
  root 'welcome#index'

  #--=== 前台 ===--#

  # 商品 #
  resources :products do
    member do
      post :add_to_cart
    end
  end

  # 購物車 #
  resources :carts do
    collection do
      delete :clear # 清空購物車
      post :checkout # 下訂
    end
  end
  resources :orders 
  resources :cart_items


  #--=== 後台 ===--#
  namespace :admin do

    # 品牌 #
    resources :brands do
      member do
        post :publish
        post :hide
      end
    end


    # 類型 #
    resources :category_groups do
      member do
        post :publish
        post :hide
      end
    end

    # 分類 #
    resources :categories do
      member do
        post :publish
        post :hide
      end
    end

    # 商品 #
    resources :products do
      member do
        post :publish
        post :hide
      end
    end

  end

end
