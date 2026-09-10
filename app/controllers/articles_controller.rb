class ArticlesController < ApplicationController
  def index
    @articles = Article.all  # this line will get all articles from database. Also @articles is instance variable so rails make it availabe for view.
  end

  def show
  @article = Article.find(params[:id])
  end

end
