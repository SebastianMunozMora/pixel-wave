require "date"
class Article < ApplicationRecord
    belongs_to :author
    has_one_attached :image
    has_many :comments
    belongs_to :category
    validates :image_caption, length: { maximum: 255 }

    scope :visible, -> { where(hidden: false) }
    scope :by_author_id, -> (author) { where(author: author) }
    scope :by_category_id, -> (category) { where(category: category) }
    scope :search, -> (term) {
        where("title LIKE ? OR body LIKE ?", 
            "%#{term}%", "%#{term}%") 
        }

    has_rich_text :content

    # Ensure the title is URL-friendly
    def to_param
        "#{id}-#{title.parameterize}"
    end
end
