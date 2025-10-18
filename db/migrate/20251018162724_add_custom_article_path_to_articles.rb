class AddCustomArticlePathToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :path, :string
  end
end
