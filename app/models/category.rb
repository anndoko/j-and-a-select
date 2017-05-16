class Category < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: true

  # 關聯 #
  belongs_to :category_group
  has_many :products

  # 發佈 / 隱藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 上傳分類 Logo 圖 #
  mount_uploader :logo, ImageUploader
end
