module Admin::IntrosHelper
  # 判斷分類隱藏狀態，顯示 Public/Hidden 狀態
  def render_intro_status(intro)
    if intro.is_hidden
      content_tag(:span, "", :class => "fa fa-lock fa-fw")
    else
      content_tag(:span, "", :class => "fa fa-globe fa-fw")
    end
  end

  # 判斷分類隱藏狀態，顯示 Publish/Hide 按鈕
  def render_intro_publish_or_hide(intro)
    if intro.is_hidden
      link_to(t('btn-publish'), publish_admin_intro_path(intro), :method => :post, :class => 'btn btn-sm btn-default')
    else
      link_to(t('btn-hide'), hide_admin_intro_path(intro), :method => :post, :class => 'btn btn-sm btn-default')
    end
  end
end
