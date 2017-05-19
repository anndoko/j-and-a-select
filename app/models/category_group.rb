class CategoryGroup < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :name, presence: true

  # 關聯 #
  has_many :categories

  # 檔案上傳 #
  mount_uploader :image, GroupUploader

  # 發佈 / 隱藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 上傳類型 Logo 圖 #
  mount_uploader :logo, ImageUploader

  # Scope #
  scope :published, -> { where(is_hidden: false) }

end
