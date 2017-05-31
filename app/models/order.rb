class Order < ApplicationRecord
  # 生成亂序號碼 #
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid # Ruby 內建亂序生成器
  end

  # 新增/修改欄位限制與提示 #
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  # 關聯 #
  belongs_to :user
  has_many :order_items


  # 付款 #

  # 付款方式選項
  PAYMENT_METHOD = ['VISA/Master', 'PayPal', 'Other']
  validates_inclusion_of :payment_method, :in => PAYMENT_METHOD

  # 更新付款方式欄位
  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  # 更新付款狀態欄位：已付款
  def pay!
    self.update_columns(is_paid: true)
  end

  # AASM 訂單狀態 #
  include AASM

  # 定義狀態
  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    # 付款
    event :make_payment, after_commit: :pay! do
      # 狀態更改為：已付款
      transitions from: :order_placed, to: :paid
    end

    # 出貨
    event :ship do
       # 狀態更改為：已出貨
      transitions from: :paid, to: :shipping
    end

    # 到貨
    event :deliver do
       # 狀態更改為：已到貨
      transitions from: :shipping, to: :shipped
    end

    # 退貨
    event :return_good do
       # 狀態更改為：已退貨
      transitions from: :shipped, to: :good_returned
    end

    # 取消訂單
    event :cancel_order do
      # 狀態更改為：訂單已取消
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end

  end

end
