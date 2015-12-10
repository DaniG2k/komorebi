module ApplicationHelper
  def title(*parts)
    content_for(:title) { (parts << t(:website)).join(' - ') } if parts.present?
  end

  def set_html_lang
    I18n.locale.to_s
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end