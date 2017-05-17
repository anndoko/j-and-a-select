class Intro < ApplicationRecord
  # 新增/修改欄位限制與提示 #
  validates :title, presence: true
  validates :content, presence: true
  validates :link, presence: true

  mount_uploader :image, IntroUploader

  scope :published, -> { where(is_hidden: false) }
end
