class Product < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal: 0 }
  validates :category_id, presence: true
  validates :brand_id, presence: true

  # 關聯 #
  belongs_to :category
  belongs_to :brand
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images

  # 發佈 / 隱藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # Scope #
  scope :published, -> { where(is_hidden: false) }

end
