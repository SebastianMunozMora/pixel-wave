class CreateImageCaptions < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :image_caption, :string
  end
end
