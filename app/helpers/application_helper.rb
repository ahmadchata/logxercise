module ApplicationHelper
  # Returns full title per page basis
  def full_title(page_title = '')
    base_title = 'Logxercise'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
