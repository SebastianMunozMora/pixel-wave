class AddDislikesCunterToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :dislikes, :number
  end
end
