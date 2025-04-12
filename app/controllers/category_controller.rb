class CategoryController < ApplicationController
  def index
    @networks = {
      "LinkedIn" => "https://www.linkedin.com/in/sebastian-munoz-mora-70799863/",
      "Facebook" => "https://www.facebook.com/SebastianMunozMora93/",
      "Instagram" => "https://www.instagram.com/semm93/",
    }
    @authors = Author.all
    @categories = Category.all

  end

  def video_games

    @category = Category.find_by(name: "video-games")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def movies
    @category = Category.find_by(name: "movies")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def comics
    @category = Category.find_by(name: "comics")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def books
    @category = Category.find_by(name: "books")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def tech
    @category = Category.find_by(name: "tech")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def entertainment
    @category = Category.find_by(name: "entertainment")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def science
    @category = Category.find_by(name: "science")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end
  
  def lifestyle
    @category = Category.find_by(name: "lifestyle")
    @articles = searchArticles(params[:q], @category.articles.order(created_at: :desc))
  end

  private
  def searchArticles(term, articles)
    @term = term
    @articles = articles

    (@term && @category.articles.search(@term)) || @articles
  end
end
