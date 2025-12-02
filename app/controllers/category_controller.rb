class CategoryController < ApplicationController
  def index
    @category = Category.find_by(name: request.path.split("/")[-1]) || ""

    if @category
      @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
    end
  end

  def video_games

    @category = Category.find_by(name: "video-games")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end
  
  def movies
    @category = Category.find_by(name: "movies")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end
  
  def comics
    @category = Category.find_by(name: "comics")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end
  
  def books
    @category = Category.find_by(name: "books")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end
  
  def tech
    @category = Category.find_by(name: "tech")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end
  
  def entertainment
    @category = Category.find_by(name: "entertainment")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end

  def music
    @category = Category.find_by(name: "music")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end

  def science
    @category = Category.find_by(name: "science")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end
  
  def lifestyle
    @category = Category.find_by(name: "lifestyle")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end

  def series
    @category = Category.find_by(name: "series")
    @articles = searchArticles(params[:q], @category.articles.visible.order(created_at: :desc))
  end

  private
  def searchArticles(term, articles)
    @term = term
    @articles = articles

    (@term && @category.articles.search(@term)) || @articles
  end
end
