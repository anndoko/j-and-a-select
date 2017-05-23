class Product < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: { message: "請輸入商品名稱" }
  validates :price, presence: { message: "請輸入商品售價" }
  validates :price, numericality: { greater_than: 0, message: "請輸入商品售價，必須大於零" }
  validates :quantity, presence: { message: "請入庫存數量" }, numericality: { greater_than_or_equal: 0 }
  validates :category_id, presence: { message: "請選擇商品分類" }
  validates :brand_id, presence: { message: "請選擇商品品牌" }

  # 關聯 #
  belongs_to :category
  belongs_to :brand
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  has_many :wish_lists
  has_many :wish_list_owners, :through => :wish_lists, :source => :user
  has_one :order_item

  # 發佈 / 隱藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 檢查 is_hidden 的 boolean 值 #
  def hidden?
    is_hidden
  end

  # Scope #
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

end
