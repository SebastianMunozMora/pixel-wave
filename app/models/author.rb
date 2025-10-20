class Author < ApplicationRecord
    has_one_attached :avatar

    scope :search, -> (term) {
        where("name LIKE ?", 
            "%#{term}%") 
        }

    def low_quality_image
        avatar.variant(format: :webp, resize_to_limit: [50, 50]) # Resize and reduce quality
    end   
end
