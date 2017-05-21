module Admin::BrandsHelper
  # 判斷品牌隱藏狀態，顯示 Public/Hidden 狀態
  def render_brand_status(brand)
    if brand.is_hidden
      content_tag(:span, "", :class => "fa fa-lock fa-fw")
    else
      content_tag(:span, "", :class => "fa fa-globe fa-fw")
    end
  end

  # 判斷品牌隱藏狀態，顯示 Publish/Hide 按鈕
  def render_brand_publish_or_hide(brand)
    if brand.is_hidden
      link_to(t('btn-publish'), publish_admin_brand_path(brand), :method => :post, :class => 'btn btn-sm btn-default')
    else
      link_to(t('btn-hide'), hide_admin_brand_path(brand), :method => :post, :class => 'btn btn-sm btn-default')
    end
  end

  # 判斷品牌 Logo，顯示圖片或尚無圖片訊息
  def render_brand_logo(brand)
    if brand.logo.present?
      image_tag(brand.logo.other.url)
    else
      t('notice-no-image')
    end
  end

end
