module ArticlesHelper
  def image_caption_formatter(caption)
    caption.gsub(".png", "").gsub("-", " ").titleize
  end
end
