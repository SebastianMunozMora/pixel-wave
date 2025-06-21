class AddExcerptToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :excerpt, :string
  end
end
