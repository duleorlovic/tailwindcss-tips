module ApplicationHelper
  def layout(style)
    @layout = style
  end

  def fetch_layout
    @layout ||= 'responsive_and_dark'
    "layouts/#{@layout}"
  end
end
