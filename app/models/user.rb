class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :nickname, presence: { message: "请输入用戶名" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 關聯 #
  has_many :orders
  has_many :wish_lists
  has_many :wish_list_items, :through => :wish_lists, :source => :product

  # 將該商品加入願望清單
  def add_to_wish_list!(product)
    wish_list_items << product
  end

  # 從願望清單上刪除該商品
  def remove_from_wish_list!(product)
    wish_list_items.delete(product)
  end

  # 商品是否在使用者的願望清單中
  def is_wish_list_owner_of?(product)
    wish_list_items.include?(product)
  end

  # 檢查 is_admin 的 boolean 值 #
  def admin?
    is_admin
  end



end
