class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
    
  def index
    @articles = Article.all  # this line will get all articles from database. Also @articles is instance variable so rails make it availabe for view.
  end

  def show
   @article = Article.find(params[:id])
  end

  def new
   @article = Article.new
  end

  def create
   @article = Article.new(article_params)

   if @article.save
    redirect_to @article
   else
    render :new, status: :unprocessable_entity
   end
  end

private

 def article_params                          #Only allow title and description to come from the form.
  params.require(:article).permit(:title, :description)
 end

end
