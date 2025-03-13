module ApplicationHelper
  def truncate_words(text, word_limit)
    words = text.split
    if words.size > word_limit
      words[0...word_limit].join(' ') + '...'
    else
      text
    end
  end
end
