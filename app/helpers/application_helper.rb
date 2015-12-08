module ApplicationHelper
  def title(*parts)
    content_for(:title) { (parts << t(:website)).join(' - ') } if parts.present?
  end
end