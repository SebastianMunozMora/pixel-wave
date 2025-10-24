class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :require_admin_or_editor, only: %i[new create edit update destroy]

  skip_before_action :authenticate_user!, only: %i[index show like dislike]
  # GET /articles or /articles.json
  def index
    @articles = Article.all
    @networks = {
      "Facebook" => "https://www.facebook.com/profile.php?id=61577847925384",
      "Instagram" => "https://www.instagram.com/pixelwave64/",
    }
    @authors = Author.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  def showThumbs

    render thumb
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @article = Article.find(params[:id])
    @article.increment!(:likes)
    respond_to do |format|
      format.html { redirect_to @article, notice: "Liked!" }
      format.json { render json: { likes: @article.likes } }
    end
  end

  def dislike
    @article = Article.find(params[:id])
    @article.increment!(:dislikes)
    respond_to do |format|
      format.html { redirect_to @article, notice: "Disliked!" }
      format.json { render json: { dislikes: @article.dislikes } }
    end
  end

  private
    def require_admin_or_editor
      unless current_user.admin? || current_user.editor?
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end

    def require_password
      known_password = "ParisSnakeEater" # Replace with your desired password
      unless params[:password] == known_password
        redirect_to articles_path, alert: "You must provide the correct password to perform this action."
      end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :author_id, :category_id, :content, :image_caption, :hidden, :excerpt, :path, images: [])
    end
end
