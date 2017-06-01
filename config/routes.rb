Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #--=== 首頁 ===--#
  root 'welcome#index'

  #--=== 前台 ===--#

  # 商品 #
  resources :products do
    member do
      post :add_to_cart
      post :add_to_wish_list
      post :remove_from_wish_list
      post :setup_currency
    end

    # 搜索 #
    collection do
      get :search
    end
  end

  # 購物車 #
  resources :carts do
    collection do
      delete :clear # 清空購物車
      post :checkout # 下訂
    end
  end

  # 訂單 #
  resources :orders do
    member do
      post :pay_with_paypal # 使用 PayPal 付款
      post :apply_to_cancel # 申請取消訂單
    end
  end

  resources :cart_items

  #--=== 使用者專區 ===--#
  namespace :account do
    # 用戶中心 #
    resources :users
    # 訂單歷程 #
    resources :orders
    # 收藏清單 #
    resources :products do
      member do
        post :add_to_cart
        post :remove_from_wish_list
      end
    end
  end


  #--=== 管理員專區 ===--#
  namespace :admin do

    # 訂單管理 #
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end

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
        post :chosen
      end
    end

    # 首頁 Covers #
    resources :intros do
      member do
        post :publish
        post :hide
      end
    end
  end
end
