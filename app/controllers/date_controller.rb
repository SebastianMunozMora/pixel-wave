class DateController < ApplicationController
  def index
    @articles = Article.visible

    if params[:current]
      @currentDate = params[:current]
      @articles = Article.visible.where("DATE(created_at) = ?", @currentDate)

      @term = params[:q]
      if @term
        @articles = searchArticles(@term, @articles)
      end
    end

    
  end

  def current_date

    if params[:current]
      @currentDate = params[:current]
    end

    @articles = Article.where("DATE(created_at) = ?", @currentDate)
  end


  def latest
    @articles = Article.visible
  end

  def oldest
    @articles = Article.visible
  end

  private
  def searchArticles(term, articles)
    @term = term
    @articles = articles

    (@term && @articles.search(@term)) || @articles
  end
end
