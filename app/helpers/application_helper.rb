module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def tab_class(name)
    return '' unless params[:controller]
    controller = params[:controller].split("/").last
    (controller == name) ? 'active' : ''
  end
end

