require "date"
class Article < ApplicationRecord
    belongs_to :author
    has_one_attached :image
    belongs_to :category

    scope :by_author_id, -> (author) { where(author: author) }
    scope :by_category_id, -> (category) { where(category: category) }
    scope :search, -> (term) {
        where("title LIKE ? OR body LIKE ?", 
            "%#{term}%", "%#{term}%") 
        }

    has_rich_text :content
end
