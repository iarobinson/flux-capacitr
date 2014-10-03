module ApplicationHelper
  def csrf_token
    html = <<-HTML
    <input type="hidden"
           name="authenticity_token"
           value="#{form_authenticity_token}">
    HTML
    html.html_safe
  end
  
  def random_bg
    images = [
      "/images/cover.jpg",
      "/images/cover2.jpg",
      "/images/cover3.jpg",
      "/images/cover4.jpg",
      "/images/cover5.jpg",
      "/images/cover6.jpg",
      "/images/cover7.jpg",
      "/images/cover8.jpg"
    ]
    images.sample
  end
end