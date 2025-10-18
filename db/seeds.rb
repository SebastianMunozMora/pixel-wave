# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Category.create!([{ name: "video games" }, { name: "movies" }, { name: "comics" }, { name: "books" }, { name: "entertainment" }, { name: "tech" }, { name: "science" }])
#
#
#Category.create!([{ name: "lifestyle" }])

#categoryToEdit = Category.find(1)

#categoryToEdit.name = "video-games"

#categoryToEdit.save

#Category.create!([{ name: "series" }])
#

# Article.all.each do |article|
#   article.update(comments: "This is a Comment")
# end

# Add random dislikes to all articles
Article.all.each do |article|
  article.update(dislikes: 0) # Assign a random number of dislikes between 0 and 50
end
