module ApplicationHelper
  def truncate_words(text, word_limit)
    words = text.split
    if words.size > word_limit
      words[0...word_limit].join(' ') + '...'
    else
      text
    end
  end

  def render_html(rich_text)
    # Unescape HTML entities like &lt; and &gt; to render actual HTML
    unescaped_content = CGI.unescapeHTML(rich_text.body.to_s)

    # Return the unescaped content marked as safe for rendering
    unescaped_content.html_safe
  end
end
