class Task < ApplicationRecord
  belongs_to :user

  content = AutoHtml::Pipeline.new(
    AutoHtml::HtmlEscape.new,
    AutoHtml::Markdown.new,
    AutoHtml::Image,
    AutoHtml::Link,
    AutoHtml::SimpleFormat
  )

  def text=(t)
    super(t)
    self[:text_html] = content.call(t)
  end

  # auto_html_for :content do
  #   html_escape
  #   image
  #   youtube(:width => "100%", :height => 250, :autoplay => false)
  #   link :target => "_blank", :rel => "nofollow"
  #   simple_format
  # end
end
