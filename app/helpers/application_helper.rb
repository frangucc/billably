module ApplicationHelper

  def tab_class(name)
    return '' unless params[:controller]
    controller = params[:controller].split("/").last
    (controller == name) ? 'active' : ''
  end
end

