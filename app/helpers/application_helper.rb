module ApplicationHelper
  def title(*parts)
    content_for(:title) { (parts << t(:website)).join(' - ') } if parts.present?
  end

  def set_html_lang
    I18n.locale.to_s
  end

  def copyright_date
    year = Time.zone.now.year
    year.to_i == 2016 ? "#{year}" : "2016-#{year}"
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
