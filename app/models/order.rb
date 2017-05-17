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

end
