class MainPageController < ApplicationController
  def index
    @term = params[:q]
    @articles = Article.order(created_at: :desc)
    @networks = {
      "LinkedIn" => "https://www.linkedin.com/in/sebastian-munoz-mora-70799863/",
      "Facebook" => "https://www.facebook.com/SebastianMunozMora93/",
      "Instagram" => "https://www.instagram.com/semm93/",
    }
    @authors = Author.all
    @categories = Category.all

    
    if @term
      @authorSearch = @term ? @authors.search(@term) : nil
      @categorySearch = @term ? @categories.search(@term) : nil
  
      @articleSearch = []
  
      @authorSearch.each do |i|
        @articleSearch.concat(@articles.by_author_id(i))
      end

      @categorySearch.each do |i|
        @articleSearch.concat(@articles.by_category_id(i))
      end 
      
      @articleSearch.concat(@articles.search(@term))
    end


  end


  def formatDate(date)
    strftime(date, "%Y-%m-%d")
  end
end
